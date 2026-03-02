Return-Path: <jan.kiszka@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071F9EB362A
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 18:08:27 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.167137.1772474897118939766
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 10:08:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=SMYhHVxE;
 spf=pass (domain: siemens.com, ip: 52.101.70.51, mailfrom: jan.kiszka@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYZpUX0aa2LMYAZtLTnaTkuO2YrmnkNyBsUyeRlbdGvK0aC3YX/JOb/nB0XfZ0wQURr9g4p85rabM8hjQBcNBBTzplYxuDo7Is6WNgAldzE3JWQv2vn/kf1MhSlUdHy/K6/XW0/h7UML6Jm2QXWQrgX6BMe+zXhjONDGftiIRJ3seFIzsm8GBE8Dlh+oZkFxWOijb47veXbDPiCrbMVLrqF/kVGOcu0gdqpYcsNnjNd3QhTESfNamgpCUdOmaC087dOHImLfiSvnjRI+gJiTG9cEdhlSNqZ2xNsX7ZxfxU9qSN0l+6qREbYkVAENmfYR7Zkc+L0eprhXy0AklxaPuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIzkhJ5x/WKpnpV548egqLE3UHmLzdR26c97rf8O99Q=;
 b=jH+U8TpCVhroHiBYuyfb+5sEBtOVcphoT557r2WDF7jFwe3CNsgafsIomGLQiAKR4lsTXIVVoKb0cKPDfqZVa7FQ0090NcH19GnfGMBqAGRRQd2qo+2reA1pOw0CW1IhzAE/5o990WvNWXx2G2vxIdvZTnNK1z73F4Jp7V0idzpEq8BLX3NvExtzqvFV6fTwEqRc9ZOXr/MhVdNDMPXw1THy3f0fiVqPs2VbvUtxbrYuf93Trv+c0695ZOBlIQBkVQj8r0Luswz4hoHXZPQT+i0jLl7XU02ubgGuzM1QJhPZZL13dTVA4i+LKFKxyLHh0TCDRQqhZuFonxNMRJePbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIzkhJ5x/WKpnpV548egqLE3UHmLzdR26c97rf8O99Q=;
 b=SMYhHVxEEUIrAXDBztX53+ZEDAwIVHsf9HdiFtazEYN3KKuqCdUdSg2Nkenbnmb21chYZC9gf49QQGXmHlmx2+xadaG/z/83ZiZ33ynq8qE0lu5bXqGbeoIWPK4NYvRzz1EzQ6lWd6IzmzOdc4lczU/k/R9jx9eoTMgz/dH4rk3PPk2GLebDvDjdEcqXC8KAqTksW6egJcxINHupW73r/y03R2B2BX7GJKDA7d3jFbDVLNe8n9gNS/KbLoE30nKD9nC3MyPf51ai5iOiLMu/kOwNu5wJRgpKAWRzv9YMtTMlNGwiDxyGiXueEBqwFUERk8EbS/TxZYhtrGltLGPtJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by PA1PR10MB9150.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:443::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 18:08:11 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::be9f:e8ca:ee9:83e1]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::be9f:e8ca:ee9:83e1%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 18:08:11 +0000
Message-ID: <a6ff3448-9e34-46f7-be2b-8d25d6fa3dbf@siemens.com>
Date: Mon, 2 Mar 2026 19:08:10 +0100
User-Agent: Mozilla Thunderbird
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] optee-client: Make include reusable outside of meta-arm
Content-Language: en-US
To: meta-arm@lists.yoctoproject.org
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::22) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|PA1PR10MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: b7f91980-6d12-4805-7505-08de7886aa63
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	r+5Ypu7Z1fvpYkO0DY741qQRB2QNeIT0elaSYakoUr8mGQP+l2Efs4PT0UHky4Kb66ysndTNpUf4nss3w8S1MS7ZGm7KUR+LDVhBeO8PK6i0dLK1e0Ihhex4vOLFwVUq1o5rdkiWnnnzM1KBNCMS8YTxoCSihnlETbNPtpTUKePiT0gnFrdhcE/5NFrkV+5chp3/6OlacoHjbNvHnzP0f+Gb1hjh/FQTbgXuya43mjQjHQO1wDS22i8DpqFw57UOC6LB3kDsZCT+mBjJ8D3kqYuu1pqxFYFG2XrdBvw059iy6/CtRzWz0dHDHtWsScGJcGdSryiMsu7u7N78HKs5YPrKgE3tBdRBZA5HOjmO+Aeuvqd3O9QrS3u7XvtCt8dDTnmn1aMt87G0KqkEAXvXQG9xRiuHkD9/fjcQwR4kibLkcEa1Fyin+Mmdu9jG2SNuNxlrr/Rey+8Ix1ta1unF2bo+8505Xuc4z1fidVwDziQ/4blbFW0HgmK6utFXAyN2jaUuH1qO6k6U+BZobVje6AfS33Db6nBPgt4j5jVUEmf7vrzceANlp5QHHoAhed5y5F7392u9T/3nzLPO3bWBQBmJ95itxyVpsxKdA//E9jdbOVGioNRQeyJNHRmu0h919GVcANN55z+fYpV8iO9HXD9/G+kE/+arHn2A6GZ/eTAC8l3kqwnT+kQmHxfSuytaTkH9/6mlzMfL4XLMF6kEt1p7kE6msOX/7N4W/3dn1O4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bllHbWdwZzZYcWtKLzFRZllVK1ZmemVKdjQvTDI1UGJEOU9NVEdQUlQyczho?=
 =?utf-8?B?OXBTQy9xVDNpSTVEdXBOL3A0c1E5QUFZM1pEVzJNMHVvUTZHajJ5ZWp1MDBB?=
 =?utf-8?B?TFNpZ1hidWI0bTd3dTIzVTM2WG9KRXQwVXc1eVVzQVg1MTlWZG9rTSswY3JK?=
 =?utf-8?B?dVFLQXB5dGVJVWpIZFQ2TTV4TGhJSitHUWpkTGdJaTJ4YW5NdGNHaVRWaFNs?=
 =?utf-8?B?Njd1eVhCUnVzZ3BJS1FOUWZmS0Z3R3ZiSXJ0Z21EQ2xuRHVhNWc5YS9uWEZv?=
 =?utf-8?B?NzZ6THdiMVFhbjRTcHFwclZjWlVtQ05JeDFOOFlhbHJyNEV4cHBhNUhXQm1u?=
 =?utf-8?B?Y3VEd3NQK0xxbWhMc085ZkhVSGpsZ3Fvd3E5bXp1YnptT2pTeUZyblVCcDVl?=
 =?utf-8?B?ZlpDU2pBMllqNHZCOS9qSkdJb2FsY1l0U1ZYcHAzOU52a2pOTmRlOWFQTmEz?=
 =?utf-8?B?bzVFUzdYY3dXMlUzY1crSjJxYnA2TnpjMG9vTVlyeTUwZFRPdXBscW1LVDJl?=
 =?utf-8?B?VmdxenMyRXNscGdTdVFLcE9GelpMSldHQ1FLYkNRRGhnYlpLdkR4dDA2czcx?=
 =?utf-8?B?MlZ3M0NkbG50YzNvblpyMWlVcm9BS3JjcHFUNldUSFpUckJ0a3puaUF0L0M5?=
 =?utf-8?B?NEtFN1NQWlR3WjQ5bTI3S0tFTnZnek1wOUV6TEQ5dXh2TTVYM2xiRG55Q09C?=
 =?utf-8?B?MnVsajNKUzc1VHEvN2FvWCtZVmdhd0Vnc2s1ekw5TFI4Q08xaXQrYWltdWVX?=
 =?utf-8?B?ZXUwOUp3Q0w1NEQ1UVprQmw4UXE0OWxGRUxuZGY3UUZtaDBZY29mcWxvSC9r?=
 =?utf-8?B?ZFNoUGVIcEZzNzNVVEJzcHBRMGM2blFyVlVxK0d5bCtwTmtvNCtvL2lkYkVz?=
 =?utf-8?B?MXh6a2huUUJWUjhsaURWQ3UyTDZ6VXBaSEg1K0pySVdRZk9UWXBMRnJnTUpl?=
 =?utf-8?B?OWNFbERqNW03clE4UDBuZkN4WGUvK3Y0RDBrVnZETE1IMi9ubVlud1RLb21z?=
 =?utf-8?B?L2gvUWRXWks0Um5MYnhraE5oVkhaYm5xUFc1a0U3RCs4ak03ZDZuQk1IMHc4?=
 =?utf-8?B?MzlkWjQzQ3JYdlh2YmNPcWFIRHhCYjR5eENhNkZDQ3ZKUG5nM3hWcGlJeWlX?=
 =?utf-8?B?YjIzVER2Q1ErMGZuT3ZuUlZmUVA2NnZGTlJDaFpjbzlXTVczdElhdXhUeHg4?=
 =?utf-8?B?L3V5SHFOaktNZk84azd5MXlMblFleFR2WVlveS9zQ2E2NUp5dVJtdTVvU2Nu?=
 =?utf-8?B?QmV5VUxYdENuTURZaG81V01zc2pQSTgyRlVJcmQ2VjJzYTZMUWNiRUtLSlJo?=
 =?utf-8?B?bXpNZUZtZkpLMnh3d21FVnozVjlCNEpCcUtaL1I0N1pHMVlKc3M3anZKb2g3?=
 =?utf-8?B?cjVmZXM5N3dnOGZWRzcwbUdlVDlnN0w0WTI2b2V0N1I1VnRBUjBjNk1aQnFx?=
 =?utf-8?B?OHZ3d2hOWjNhaHZsZ0kzdk1mU0pPZmlJd2xxVkZ6am9XNTZKWFljSC9FYThI?=
 =?utf-8?B?eFlsRXJKU2FuWW5XTGdjUWZUV1J3R2xJNXlDSXRyeFZpQ0JwdmkzRjBQSjAx?=
 =?utf-8?B?cTJxeCt2Vm80VndPVmQyQzFFcVQwMHhVN0haU0gyQjM2aG9Semh1QmVVWitm?=
 =?utf-8?B?VXI2YlpTNWJsL1BSR1FRakZESTB3LzF0NW10OSs4eml2OWZ3d1VCMTFDVzV1?=
 =?utf-8?B?MXZJR2VGcVRJalJjK3Y4L0J1QzhnRFF6dFp2d3NBYTNDd2ptZndsTUppcUk5?=
 =?utf-8?B?bGNWS3lqMEp6RFN4QUZDaUtDdWtvbk90VmNzWmFmeFJlNWNXTjdaYXVnbFda?=
 =?utf-8?B?aW1yNGRBdk9IUzRxNWd1a2d5MWFiRjJFRnBuamdIRExWc2ZhR2M3TmdpRmZ3?=
 =?utf-8?B?dldmT3lzUDRSd2xKQUZaalE0YVByK1pKaXNCZG13K0VRYlNGZ01UZUxoVGI5?=
 =?utf-8?B?QlE5RmNjU04xNWpkMjZMRmtwSnNYZHRQdnc0dEcyN0xjSldCSEY5bERTcXFW?=
 =?utf-8?B?d0RZVlptVjRWV0VMVDJITXE1OTA3eWZCV1NjM2d4WFBHa2lkM3hTNVNGT3k2?=
 =?utf-8?B?VEdud043QXVFOXBxZEg0RE1ibDZpNWpoc0hkakxNbDNpS2E5V0kyell1TnJF?=
 =?utf-8?B?RGx1YXNRdGx0azhlZXQyWFBWWlRTWUppc0cxMXFzNWhSbVc3bm5ZRXFjVWhS?=
 =?utf-8?B?amIvS0xDbmFJOUptdXBMejlMTkhoYnlLeUZVN3BpWG1OcUJkVllmU3ZrL0dV?=
 =?utf-8?B?a2FsK284Yko2MzljSkJ3VnVsN050d29MMmdzb1FLeU42WHRxTTQySDF4dUNx?=
 =?utf-8?B?RnAvYUFvbUtWenNndEl1OHFLSC85SFhNNmhVTUVoamt2Z0ZhK1Rxdz09?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f91980-6d12-4805-7505-08de7886aa63
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 18:08:11.4858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cafsbGY86r0ZAlW8MauXBtVKr4+4hAQxSXM6xH9mq30fT3DzHc1UWbevztxph7X9W0MsNMjnPL2ASQ/n6rpiqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9150
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 02 Mar 2026 18:08:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6932

From: Jan Kiszka <jan.kiszka@siemens.com>

Set FILESEXTRAPATHS so that artifacts that meta-arm injects can still be
found when using the include from a different layer.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 meta-arm/recipes-security/optee/optee-client.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
index 4d3d83da..343d573a 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -10,6 +10,7 @@ inherit systemd update-rc.d cmake useradd pkgconfig
 DEPENDS += "util-linux"
 EXTRA_OEMAKE += "PKG_CONFIG=pkg-config"
 
+FILESEXTRAPATHS:prepend := "${THISDIR}/optee-client:"
 SRC_URI = " \
     git://github.com/OP-TEE/optee_client.git;branch=master;protocol=https \
     file://tee-supplicant.sh \
-- 
2.47.3

