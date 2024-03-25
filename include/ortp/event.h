 /*
  The oRTP library is an RTP (Realtime Transport Protocol - rfc3550) stack.
  Copyright (C) 2001  Simon MORLAT simon.morlat@linphone.org

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

#ifndef ortp_events_h
#define ortp_events_h

#include <ortp/str_utils.h>
#include <ortp/rtcp.h>

typedef mblk_t OrtpEvent;

/* type is one of the following*/
typedef enum {
	ORTP_EVENT_STUN_PACKET_RECEIVED               = 1,
	ORTP_EVENT_PAYLOAD_TYPE_CHANGED               = 2,
	ORTP_EVENT_TELEPHONE_EVENT                    = 3,
	ORTP_EVENT_RTCP_PACKET_RECEIVED               = 4, /**<when a RTCP packet is received from far end */
	ORTP_EVENT_RTCP_PACKET_EMITTED                = 5, /**<fired when oRTP decides to send an automatic RTCP SR or RR */
	ORTP_EVENT_ZRTP_ENCRYPTION_CHANGED            = 6,
	ORTP_EVENT_ZRTP_SAS_READY                     = 7,
	ORTP_EVENT_ICE_CHECK_LIST_PROCESSING_FINISHED = 8,
	ORTP_EVENT_ICE_SESSION_PROCESSING_FINISHED    = 9,
	ORTP_EVENT_ICE_GATHERING_FINISHED             = 10,
	ORTP_EVENT_ICE_LOSING_PAIRS_COMPLETED         = 11,
	ORTP_EVENT_ICE_RESTART_NEEDED                 = 12,
	ORTP_EVENT_DTLS_ENCRYPTION_CHANGED            = 13,
	ORTP_EVENT_TMMBR_RECEIVED                     = 14,
} OrtpEventType;


typedef enum {
	OrtpRTPSocket,
	OrtpRTCPSocket
} OrtpSocketType;

struct _OrtpEventData{
	OrtpEventType type;
	mblk_t *packet;	/* most events are associated to a received packet */
	struct sockaddr_storage source_addr;
	socklen_t source_addrlen;
	ortpTimeSpec ts;
	union {
		int telephone_event;
		int payload_type;
		bool_t dtls_stream_encrypted;
		bool_t zrtp_stream_encrypted;
		bool_t ice_processing_successful;
		struct _ZrtpSas{
			char sas[32]; // up to 31 + null characters
			bool_t verified;
			bool_t pad[3];
		} zrtp_sas;
		OrtpSocketType socket_type;
		uint64_t tmmbr_mxtbr;
		uint32_t received_rtt_character;
	} info;
};

typedef struct _OrtpEventData OrtpEventData;



#ifdef __cplusplus
extern "C"{
#endif

ORTP_PUBLIC OrtpEvent * ortp_event_new(OrtpEventType tp);
ORTP_PUBLIC OrtpEventType ortp_event_get_type(const OrtpEvent *ev);

ORTP_PUBLIC OrtpEventData * ortp_event_get_data(OrtpEvent *ev);
ORTP_PUBLIC void ortp_event_destroy(OrtpEvent *ev);
ORTP_PUBLIC OrtpEvent *ortp_event_dup(OrtpEvent *ev);

typedef struct OrtpEvQueue{
	queue_t q;
	ortp_mutex_t mutex;
} OrtpEvQueue;

ORTP_PUBLIC OrtpEvQueue * ortp_ev_queue_new(void);
ORTP_PUBLIC void ortp_ev_queue_destroy(OrtpEvQueue *q);
ORTP_PUBLIC OrtpEvent * ortp_ev_queue_get(OrtpEvQueue *q);
ORTP_PUBLIC void ortp_ev_queue_flush(OrtpEvQueue * qp);


#ifdef __cplusplus
}
#endif

#endif
