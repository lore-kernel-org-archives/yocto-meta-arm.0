Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC68D2126D
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 09:44:44 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.62])
 by mx.groups.io with SMTP id smtpd.web10.44648.1729158261449943454
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 02:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NGYQ0xT8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NGYQ0xT8;
 spf=pass (domain: arm.com, ip: 40.107.21.62, mailfrom: gyorgy.szing@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CGdLDmoXGmflJUkLyOY+6XHcmtY8YMu+AO7qD/CCmUZNbaVErq20Ntk0hcvgP9orHNNgJE8RW5hEHUbvkVG6WqBH0tILMSXSaa4KtJs2Ru9j6RnY8S7AOY2mgIC6l3vaq6GMWkzKqNrlnzny+eUmk+m0q7qcwjqjvczZwO0ZtIce+nIvGjrx7CSAh4IzLCS2fO7rUeuYyx5l9S+s81GEaE1+M3VAxajPWlH56obZ0w8f0vcqM9pcCmQn+QZsX4e2eMfMcwIFPPb1+FzA/WfFyWMmOShQjvlArK+WT38FVQYvsx4E6pEjq+psBCmP56l7B9eyjWzMlX6AwleTm2AFkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mmGndPsjEmYBrU9GkIk0V2rHIgmOxYZD7aQ3bvloLY=;
 b=KvIkZU9ThOg0CQFC2OuNWjV9fgJQGyU627UL9dzB8CS/RfgpqyQtJ0UVDUjQw/m6Q77gZf4Ucipd1asmeA0EUOvkMYRuipSgp58igvDBSjCuCMCG++vXZNmQY3r4PjVRXn59LwEMbSTXbmkfGNDIU+Ccl/SE0iilUiUfq1CRm2vNlfoiyp0moVG0MLsj8ld9bUZCPl5RugAuErihUqwt9jhBJnyrx3fw0jF7Fqvexi1pXYMlGX4CS6nrCjVb69QyaKwhX0Hhp8XFgNgfIeVjx/ZMAx0Kr0iFw8dm5gcNLqXzfjtl0uhNWGQeYpnWmYUyWp7ES4M44qokznAJn5bPOw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mmGndPsjEmYBrU9GkIk0V2rHIgmOxYZD7aQ3bvloLY=;
 b=NGYQ0xT8onPSA7fUg8XVl/DLGEX5TBbXovC+4B5dctOM/n2RqlKVauRLGcX9rMfxjY0GHjiP/ScM+gnZ1vHOgNmECfRigWij7/WwI/ZhYzA07LdcIvlLy7NLLQ6+Sh5tgXBP4M6oRi1k9pfkk9c8UqPTyEqpEv6UoB4Qgnyzc/0=
Received: from DUZP191CA0067.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::26)
 by AM8PR08MB6546.eurprd08.prod.outlook.com (2603:10a6:20b:355::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 09:44:17 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:4fa:cafe::46) by DUZP191CA0067.outlook.office365.com
 (2603:10a6:10:4fa::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20 via Frontend
 Transport; Thu, 17 Oct 2024 09:44:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8069.17
 via Frontend Transport; Thu, 17 Oct 2024 09:44:15 +0000
Received: ("Tessian outbound 0658930cd478:v473"); Thu, 17 Oct 2024 09:44:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9677df72efb8c024
X-TessianGatewayMetadata: 6I1A1XyNCf8WieM+lMRJaOEP0FjyJE0piQqHkoLCYhDGA+omxaKRocWO4w5RDhjcNK2+wWZCHV+7FHPqp1sFpan4vFwhQpot5firFbwyNkmRYbnVF26YNYH9GUzybi15tn1k46R5h9DHH3qCdG5y1AWJlOkv8jre7Rn8Ag8TZOWrs3L4NIuggEv5mCFfX41Bbv4ykTgyjUDMO5fP1LRfhQ==
X-CR-MTA-TID: 64aa7808
Received: from Lf43e8f9c04ae.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9BCF7E42-555D-44E6-9207-2F1008A9582C.1;
	Thu, 17 Oct 2024 09:44:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf43e8f9c04ae.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 17 Oct 2024 09:44:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMHyOa6SXsBKNXpBnjZfwloI1rlUgGvOZ1yG2EJHp+I/JF+HIpM4ZuX+VHMy52RBSdvKz92CRanwLDisEamx8yhK/jxLSEhIg9J2PpuKud7l67r6ZIGKMzEeDuhRQqK6sEKPO2n6EOkQL/KmXUaxd9Azr9EJtByahs1uex7Mv8F5KOcjTOq2Ryv65BU4sXlEjPm+qsMw1LRzFW+c6IrC3DXDm33l+RBmAvDbTOk5eQm9OhAdmKOZECG4I+jTvpnkXt9TSqkbDKT1H3nFdyL7vLWI76jaoQoTxjPIfNBJap7QWLMZ6UbDEAd8HA8m7Rf/Gpl7XjB0EApacpP265agHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mmGndPsjEmYBrU9GkIk0V2rHIgmOxYZD7aQ3bvloLY=;
 b=IqZmUGcpAwywrA2WNoEBFKMatmE/FVKgYRA6qisaZGg8j65sToHBrHSEj6QolYv1UCPFo1QDdHA6JJ5UsgGIyOi3UArpc/FEOxNeVD98OpvIDEIEsy1D5iynwyA5AO0d1fb02DsePCpESctElMef3yZJuWZ6LYNzUgfHdUuGBTWJ7kuHzT+IwteVtqVfjK791z3JrMm7tOEQACHJzp2Jo5JXSMPHu/CAipE8KmG4URN2vZN7HmmO+HtQu6aEmS3ZdMp5fyw2WSvGex+gZrrqWsaIuh93CJorao55J4kO2xk9cfPbxshvfqXvYhFkxw5lBVZE+SiAslQuYaQS4/9X3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mmGndPsjEmYBrU9GkIk0V2rHIgmOxYZD7aQ3bvloLY=;
 b=NGYQ0xT8onPSA7fUg8XVl/DLGEX5TBbXovC+4B5dctOM/n2RqlKVauRLGcX9rMfxjY0GHjiP/ScM+gnZ1vHOgNmECfRigWij7/WwI/ZhYzA07LdcIvlLy7NLLQ6+Sh5tgXBP4M6oRi1k9pfkk9c8UqPTyEqpEv6UoB4Qgnyzc/0=
Received: from AS8PR08MB5895.eurprd08.prod.outlook.com (2603:10a6:20b:298::16)
 by AS8PR08MB7766.eurprd08.prod.outlook.com (2603:10a6:20b:526::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Thu, 17 Oct
 2024 09:44:08 +0000
Received: from AS8PR08MB5895.eurprd08.prod.outlook.com
 ([fe80::bac5:353d:9e15:e4d8]) by AS8PR08MB5895.eurprd08.prod.outlook.com
 ([fe80::bac5:353d:9e15:e4d8%5]) with mapi id 15.20.8026.017; Thu, 17 Oct 2024
 09:44:08 +0000
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH v3 2/2] trusted-service: remove optee udev and
 group settings
Thread-Topic: [meta-arm] [PATCH v3 2/2] trusted-service: remove optee udev and
 group settings
Thread-Index: AQHbIGJjaIhpu//Lm0aPbjb1+Fzi/7KKmFWRgAAFrQCAAA3wIg==
Date: Thu, 17 Oct 2024 09:44:07 +0000
Message-ID: 
 <AS8PR08MB589512524CBB7BFB377101C391472@AS8PR08MB5895.eurprd08.prod.outlook.com>
References: <20241017065907.172504-1-mikko.rapeli@linaro.org>
 <20241017065907.172504-2-mikko.rapeli@linaro.org>
 <AS8PR08MB589563A608DE289457643CA991472@AS8PR08MB5895.eurprd08.prod.outlook.com>
 <ZxDMGLYsOSe9rPFO@nuoska>
In-Reply-To: <ZxDMGLYsOSe9rPFO@nuoska>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS8PR08MB5895:EE_|AS8PR08MB7766:EE_|DB1PEPF000509FA:EE_|AM8PR08MB6546:EE_
X-MS-Office365-Filtering-Correlation-Id: decd22be-151d-4318-4a06-08dcee90439f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|8096899003|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?h01wBOsBxyoZgp7nXvUtfl2o0prpnb6fT1G/M3M9gyj1QQj6piO3jdwzHoBT?=
 =?us-ascii?Q?lyxiNu8b3kxp+wQASqONVeIwncjLEYsPSZVCk3zF4WA8j/8gvOf1PlfjaoSo?=
 =?us-ascii?Q?Dpx0T2SSfvdU+/qHyXhwmUeRT5vfWtfOvsu+qnSrYbDvKU9T+ETifvrfk2QD?=
 =?us-ascii?Q?MNPyHnbmTDNpVXlb8eointBCig6MPeHBycRFtraeHAkWw8Vy74dd1kMCb0Dr?=
 =?us-ascii?Q?LgEche3EQpdljAXBJMUGon2RQzfq7/l+7oqfy3DBG3iPTaF9oc5NqkdzfHZS?=
 =?us-ascii?Q?yRhHZykpskhXXJua/I9zS+gPZJMv1IIFGXkV1esiaG7Vov4cgpzTasGukLcf?=
 =?us-ascii?Q?ZZhPcVmQXTc9oXFGVG0VckFJwJisUT1Vn/7dc5eBnVjSFryteQHjxoiJxg/Y?=
 =?us-ascii?Q?CUhR9GaUnNMcMhL1jrK5JBHhMCtHmqekgdKfYQcSrVkG+tbhraGDlCfW6+SB?=
 =?us-ascii?Q?Gb+zIGXWzN8nvSdqutlobXdW3cySuyuTASIrqBzOuo5cn8OZfAqLfwpTLXtv?=
 =?us-ascii?Q?2UQSZdoQG9BTYPCYNllZwwrRh4XNvpYu/sPFE13+ebmYuWUA4rNPIjEVoFzC?=
 =?us-ascii?Q?h6/LJOjeHzGY7/mdsvS8g3bPn9k50f7zoxqdQ1FFhMvuY3G5ANvmwCKDKgGa?=
 =?us-ascii?Q?JxqoP7T69c2eQI7wH6vpLhVAlaz2R6pqkYW+gTvghCEEXjutBs+2IVPodwIQ?=
 =?us-ascii?Q?gR77oIcjV6VUsnFGB4n36pQXuY95KVgdhMJPI+JFqwHQmydMI98gsXiXgaju?=
 =?us-ascii?Q?cX8rYX4D4dogii17dMTi4J7wnpHpCEg2GVEQiA8fJ7Iw/4ylHqjufAF7nX/x?=
 =?us-ascii?Q?GLcrMDUrqc3POxDisAsKhwnbxBnePQGp++PZxuF5MDI4HPEHBg97bfbKU15a?=
 =?us-ascii?Q?wK9cjBdXRqZ754D1RNhWzrRZl3kEGPWEt/C3NwqjJx+EjltREqR0Sb/jMctI?=
 =?us-ascii?Q?KXmC/J5fWkrx97yNv06ED6ha3ypOIW3NDuFHnYLFsG73WFcmuAxBjdNzaiNE?=
 =?us-ascii?Q?zqr6x5Hl43fo58xp+OTU7Ami00Hwb3gTr8jq+BNa7oUhBM2WSQZYPX4zYVjG?=
 =?us-ascii?Q?64OC/SLf2D7iPjAt/h4Pi5fM+m++QnH98AmFmXTsDJgLjXbeLNkxytCbGeOo?=
 =?us-ascii?Q?0ftQ8pyZbi/q3xrwO2fSvXt65lsoB8qePcFjeMArlZxkDZ5v143n9b8HAwiZ?=
 =?us-ascii?Q?kGi9I6NZ3V8Xau3fIRPJLtRZIKG3+qptvTPSH2PIXZKoLUwL8RVvxWP1jj8y?=
 =?us-ascii?Q?Z6uqS4ZXR1tP24fHHSklBsSpOLZR2H6ZU20f7Motnj3CstxQkRO/OoQjEcyc?=
 =?us-ascii?Q?IDFakgDuSHYqMMCoyHPm/H/LtRN+Z0dffiQN2mjVm7pSxxkbgajOu6lmvhIW?=
 =?us-ascii?Q?b/zrhyI=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB5895.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AS8PR08MB589512524CBB7BFB377101C391472AS8PR08MB5895eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7766
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:20b:298::16];domain=AS8PR08MB5895.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	99cd7666-3816-4f20-e512-08dcee903f02
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|35042699022|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?Windows-1252?Q?ocrls0zQew4UklcTBKeTc2pFqeYQtQtslwz7g0TOo08cAOeS/U8beZb3?=
 =?Windows-1252?Q?wv2NZo0zNKB0gO8+XV500VNiVmaTq/GvO/7TqomyWLp6bAHzPJFZCKxR?=
 =?Windows-1252?Q?YCYiMBOein3WDhjaVxnNizbucYXHoVq4/eLxKzCpM8OpYK6HunKGVN48?=
 =?Windows-1252?Q?VV+ONdV5rx47BP2+lvJo3kudZ912VQNyTrJF0/GTplscd4p9zFPmSsoP?=
 =?Windows-1252?Q?KIpObakhu+taoimo31Sh081vW70sqEx+L3S6HBWiu0Bdjucv6lWGPbt8?=
 =?Windows-1252?Q?mu+2dCjZM7+d3lKrlk3GRW1r6YSxhueCASEWGZhPg40PvAIjmzswPP6g?=
 =?Windows-1252?Q?bNkSZnfNFIBIGcrZrCyhYyiHkcWH65oBBQvAamf8u1m65+XMXUCbGCA4?=
 =?Windows-1252?Q?DAskQOx6gOQmnvkNA1emhZZQUObQ2PIDqhhxvnW8E8Z+2BbL96ZAREu9?=
 =?Windows-1252?Q?+jPyKO8xPbAsBwMdfZZCaljSWI61avxK7HyHux4jgIDGAWfJB4lLlbfp?=
 =?Windows-1252?Q?g3WQoMR2Wr+V/f68htFZhQuZXqdsbm6D5Lf9ytDkPVPSXRGmz6X7zA24?=
 =?Windows-1252?Q?PkSeIZb9RgopyML6CkHK39w04T47ir75R4zFRqCBUhZ6EEk+LR+18o8W?=
 =?Windows-1252?Q?5j/oWcdjrzXbPlElsYFb5F8RpHFLe0DaSxtX8xjnGliNVdtsf1BnaLIS?=
 =?Windows-1252?Q?TlLsg8Isi4Ce4SN+Jmd72mbEmixZ7JvNCKh5rTG+8AappaJ0w9Xn/UK4?=
 =?Windows-1252?Q?BKo7fOVYAiwTHW3RL8qyOMD9hmXNKlSv7tLMsK4AVrQi9iphU5G5pF+Q?=
 =?Windows-1252?Q?nCwf0Q4GaQkd6IwRk/wnJ5LNXEYq28D5HVSTh8Stf7l/X9M+twkHciRC?=
 =?Windows-1252?Q?yRfllLcu80Ogk8rp/aqOWw9UpIsbkHLLirhj3A1afun+N+m0QxPr2MTT?=
 =?Windows-1252?Q?Ut98D3mQudJSBPCqLlW2/3banZ2uLUEA3XadNC4Rl+NWIu5Fy3nhw9Ww?=
 =?Windows-1252?Q?3zvP56Pg/eBaVgXWBTVCsI121gPF2Gz4joYBXlOlUPsND2LO2q2sxD8M?=
 =?Windows-1252?Q?aq8bFZyjNO5I4zrry9XH2MPuJX+GvT+vrbxUlWR4VRKyjUkiwuVR/e/r?=
 =?Windows-1252?Q?ewDavb6SbNV6TxXcwLHGMZOaKd7Vu7goVBGzApf5QhdCjOsavkAHzU9S?=
 =?Windows-1252?Q?2XWjlOk1/8/gkBAY6XsEcjrGVJ4bgJMbUEu6ge2uKd3o2VqBM9fCm1MM?=
 =?Windows-1252?Q?V9QfblUEryZ/B5ysLiHFpgd8KjU+5cP+Yn77lLU2KEVnLGBWWgFeGYHj?=
 =?Windows-1252?Q?iOsToWfU34GkYFFL+Zyr3LMPmfNZFcPsmFGjvLnLkZ+JY67ehcWrfWEY?=
 =?Windows-1252?Q?awntojN67ooWYb9r93pPimDGgB22f4epir/2LpgjjiGaacip1v4H2S8r?=
 =?Windows-1252?Q?KZlCPTfuOLHdPCJN/uzkNNRcGkO6P6qjCaU7cJQk6R++zgEMRNk4Sz7t?=
 =?Windows-1252?Q?7FE5JilozlCruSr08C4I2UC7gyLfVw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(35042699022)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 09:44:15.6981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: decd22be-151d-4318-4a06-08dcee90439f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6546
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Oct 2024 09:44:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6207

--_000_AS8PR08MB589512524CBB7BFB377101C391472AS8PR08MB5895eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

The Trusted Services protocol is implemented by the tstee driver and libts.=
  This means there are multiple drivers using the tee subsystem and multipl=
e ecosystems relying on the /dev/tee devices.
Your changes move the tee driver access configuration to the op-tee client =
only and this adds a dependency between the two ecosystems. The TS ecosyste=
m will not work without the op-tee client, but op-tee client is not part of=
 that ecosystem.

Yes, the /dev/tee* devices will be still there, but only accessible with ro=
ot privileges which is kind of a feature degradation.

=93If this impacts libts users, then IMO they need to install optee-client =
orsetup the udev rules etc in some other way.=93
Yes, this =93some other way=94 is the udev rules config you are removing.

=93Is there some problem I missed or a setup which is not covered in meta-a=
rm testing?=94
AFAIK currently there is no meta-arm config which enables FF-A but does not=
 use the OP-TEE SPMC. But this will change soon. So why not do this properl=
y now?

/George


From: Mikko Rapeli <mikko.rapeli@linaro.org>
Date: Thursday, 17 October 2024 at 10:34
To: Gyorgy Szing <Gyorgy.Szing@arm.com>
Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH v3 2/2] trusted-service: remove optee udev a=
nd group settings
Hi,

On Thu, Oct 17, 2024 at 08:17:32AM +0000, Gyorgy Szing wrote:
> How is the system going to work if op-tee client is not deployed, but lib=
ts is? E.g. if the SPMC is Hafnium and no S-EL1 OP-TEE SP is needed, but th=
e FWU SP is used?

If optee-client is not installed, then optee is not functional
in Linux userspace and rootfs so optee-test fails. The plain
kernel driver for optee will work and /dev/tee* and /dev/teepriv* interface=
s
will pop up with root access rights, but not with the setup expected by
tee-supplicant systemd service file from optee-client. This may be enough f=
or TS
use cases.

In the firmware side, optee services are not affected.

If this impacts libts users, then IMO they need to install optee-client or
setup the udev rules etc in some other way.

Is there some problem I missed or a setup which is not covered in meta-arm =
testing?

Cheers,

-Mikko

--_000_AS8PR08MB589512524CBB7BFB377101C391472AS8PR08MB5895eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;
	panose-1:2 11 0 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"en-HU" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">The Trusted Services protocol is implemented by the =
tstee driver and libts.&nbsp; This means there are multiple drivers using t=
he tee subsystem and multiple ecosystems relying
 on the /dev/tee devices. <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">Your changes move the tee driver access configuratio=
n to the op-tee client only and this adds a dependency between the two ecos=
ystems. The TS ecosystem will not work
 without the op-tee client, but op-tee client is not part of that ecosystem=
. <o:p>
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">Yes, the /dev/tee* devices will be still there, but =
only accessible with root privileges which is kind of a feature degradation=
.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">=93</span><span style=3D"font-size:11.0pt">If this i=
mpacts libts users, then IMO they need to install optee-client orsetup the =
udev rules etc in some other way.</span><span lang=3D"EN-US" style=3D"font-=
size:11.0pt;mso-fareast-language:EN-US">=93<br>
Yes, this =93some other way=94 is the udev rules config you are removing. <=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US"><br>
=93</span><span style=3D"font-size:11.0pt">Is there some problem I missed o=
r a setup which is not covered in meta-arm testing?</span><span lang=3D"EN-=
US" style=3D"font-size:11.0pt">=94<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">AFAI=
K currently there is no meta-arm config which enables FF-A but does not use=
 the OP-TEE SPMC. But this will change soon. So why not do this properly no=
w?</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-fareast-languag=
e:EN-US"><br>
<br>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US">/George<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;mso-f=
areast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div id=3D"mail-editor-reference-message-container">
<div>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"col=
or:black">From:
</span></b><span style=3D"color:black">Mikko Rapeli &lt;mikko.rapeli@linaro=
.org&gt;<br>
<b>Date: </b>Thursday, 17 October 2024 at 10:34<br>
<b>To: </b>Gyorgy Szing &lt;Gyorgy.Szing@arm.com&gt;<br>
<b>Cc: </b>meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;<br>
<b>Subject: </b>Re: [meta-arm] [PATCH v3 2/2] trusted-service: remove optee=
 udev and group settings<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi,<br>
<br>
On Thu, Oct 17, 2024 at 08:17:32AM +0000, Gyorgy Szing wrote:<br>
&gt; How is the system going to work if op-tee client is not deployed, but =
libts is? E.g. if the SPMC is Hafnium and no S-EL1 OP-TEE SP is needed, but=
 the FWU SP is used?<br>
<br>
If optee-client is not installed, then optee is not functional<br>
in Linux userspace and rootfs so optee-test fails. The plain<br>
kernel driver for optee will work and /dev/tee* and /dev/teepriv* interface=
s<br>
will pop up with root access rights, but not with the setup expected by<br>
tee-supplicant systemd service file from optee-client. This may be enough f=
or TS<br>
use cases.<br>
<br>
In the firmware side, optee services are not affected.<br>
<br>
If this impacts libts users, then IMO they need to install optee-client or<=
br>
setup the udev rules etc in some other way.<br>
<br>
Is there some problem I missed or a setup which is not covered in meta-arm =
testing?<br>
<br>
Cheers,<br>
<br>
-Mikko<o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_AS8PR08MB589512524CBB7BFB377101C391472AS8PR08MB5895eurp_--

