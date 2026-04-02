Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C6E3D6AAF4
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 16:43:20 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.897.1775148191770624725
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2026 09:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=AcFyO00q;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=AcFyO00q;
 spf=pass (domain: arm.com, ip: 52.101.66.32, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qEi2gMAlyoASTwyJXQks3nhlf0Hk4fkswNIxbEtq1opEg9bESEMR65K9WH6qOW5YIHD8IEInk1bbrpEXuEZuc7VZ/JqFzi/w6fq8nPTl9su8aFyeP5Y1zJVIU9lShboqiAFiknXUloKwGTvqEHhqkvMK/IVejzXvjZu/qTqIyYFiHLogbx4ZLLtplWHGv8scrd8kQHKie0PnAVe31u9oD2EifmnFCU3zgJS2DRmiEW7IV/6FHLS0rp6+wEXiyvzPjo5Rugxdptm9Fkza0JyXR3k1qhCt2MAhWQS8NmyqPSqIxKpOQQop8G+ahe88Kex0+loj4zPw4r9VC2WK//5ulg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cR6/gxshT2z1VM3i27/RokG6CyLUCRjaG/m4+n9Y55k=;
 b=PteDIwoqrqMaqzuw/znVx4zeQGeo5H0D7r/Rmess57Qr2PfqavHUxpbYnlkXUkZvCh84X725Zi2UZYuYU47hG1t+6Db138lits9/bbTpQ9WSSq+TXUHiR8FzEaQueNcVXcUI3nOA7+HRFopm9jcq57xka7O4g0A2Vyw/nkeC5W7/XxX2W2yYNAXwfxcFwIOOQxjEhGoQqCGrP0IudRBGeRI3UMfiF2nBchNMSjmwkG9g2bimMGt3uUJCRFmAVuxVfGwR/vUjOnN1RqcMawJMrrsydSMy/ilSsZ1gPO7aM2cR0eHtgRncIiA/KA8FDNzX42v+sw5XVE/ZrwYcL//74g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cR6/gxshT2z1VM3i27/RokG6CyLUCRjaG/m4+n9Y55k=;
 b=AcFyO00qAp4xrIuA1KiPV5NiGSQOGnjoGPUso/sBUbJzaJJnytB1Mm7+WvSLeRcMts4WEKKFaHiPfdaKvY0Kg+owVzQqTkGHAWgm/vBKbMs4x6TM7DvoYVWIj1+o+c13T6mky6xrYf4LE9764oxeg3F8Wa6chmjPaJtiX8rhluk=
Received: from CWLP265CA0535.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18d::7)
 by GVXPR08MB10964.eurprd08.prod.outlook.com (2603:10a6:150:1fd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 16:43:06 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:400:18d:cafe::e3) by CWLP265CA0535.outlook.office365.com
 (2603:10a6:400:18d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Thu,
 2 Apr 2026 16:43:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 2 Apr 2026 16:43:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/IkxEpzTGVAUiDOsLIPK1Ox8vdQXlmRWCI1x2J9Bx+DdJHnZii+QMRTgKUZ43WnCEKUal8D95ErgsIcPYfvYTCMDvV9xIdStKjafQFfyjxMizBTsJuzhB7/+tuPQ+2HVv0BpkZZq93CdSprx49NrIBnFyO2RCY+6gndsZ15TfXpahd7hguUH+cYSS7jTlooImFkdc4491LFYminZ9gg6pjUosmEIwbHlNlnn6RZZwI3ZH62KmiLqf8611oEVywWr+lKAuQeVCZX4LB+2DfQn5qINt4dOvcW94CeuAY87f9x/HguYBnOqae6tcOynoxJhUdMTPISbP7hcxzf/U1OCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cR6/gxshT2z1VM3i27/RokG6CyLUCRjaG/m4+n9Y55k=;
 b=aHoUjzidBICpr/XuENgAzjlk7tJRG+naXL3LuwbgalXEkBfkwgyadz03omr87pIntS1aaaPn6exRrfQqWCp2rYVDdOkvY32pXeRkyGZs4dDQnBmSW7J85gJ7ITivOGYbc5Id8NGFafdeGsrbFjL24GyS1mGCl5VqxTJnpD88hzNEPE/dTYLyV5/pEoH3HetsgY6rhhVDHnfKqNG1jNfpGdtAsTKd8B3xgVImW/jinra+hjBwEaNmi9ZkwU+2ASBxcWvZi+dnhuH9KMLdr+mRQmleL5Ry9SYZ0QV3aPFMRSfk0I8GeYO5lmcoX9+Ag/POOQl0V/XkygHrGIHsRVZ9pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cR6/gxshT2z1VM3i27/RokG6CyLUCRjaG/m4+n9Y55k=;
 b=AcFyO00qAp4xrIuA1KiPV5NiGSQOGnjoGPUso/sBUbJzaJJnytB1Mm7+WvSLeRcMts4WEKKFaHiPfdaKvY0Kg+owVzQqTkGHAWgm/vBKbMs4x6TM7DvoYVWIj1+o+c13T6mky6xrYf4LE9764oxeg3F8Wa6chmjPaJtiX8rhluk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8297.eurprd08.prod.outlook.com (2603:10a6:20b:537::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 16:42:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 16:42:02 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 2/2] u-boot: enable tf-a support for
 genericarm64
Thread-Topic: [meta-arm] [PATCH 2/2] u-boot: enable tf-a support for
 genericarm64
Thread-Index: AQHcwcKrDDSeAlyCvk2Gs5A4sjfSDLXL+7CA
Date: Thu, 2 Apr 2026 16:42:02 +0000
Message-ID: <0810276D-F3CA-4C31-B9DB-41016EAC973A@arm.com>
References: <20260401102931.781169-1-mikko.rapeli@linaro.org>
 <20260401102931.781169-2-mikko.rapeli@linaro.org>
In-Reply-To: <20260401102931.781169-2-mikko.rapeli@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8297:EE_|AM3PEPF0000A78E:EE_|GVXPR08MB10964:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb0e0fa-2d83-4486-f3d3-08de90d6ea00
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 THdaW5PBKzXJ6LSaON05lDm1fkkmW+e5gmy2PrBEglAPQe2mNHQBziXITAAZxTxViTStW+PyzsDrMk2dZJDHOLtVQFb4VHxJ9/jYfgK1anXrl7JtSX9df7OuySXiu2XiWqSC4oRjsfZRJ0TtKCxkIW5gpMTw3Di942pmW5W8325iU9eKkpAYNpEPm/sHdA8JWPOsI40iUHwoQqVpzc5pGDGhxpXRQOpAJ1AJkCfaeiIx0aY32bq51l9AyD1c+R8ah3Gz6t5JEDY6XS7I3xUtT2fFcjHpSBN6wpGdK38t322/xCOxzxizVodWXKYOl4treQ7ObEzbEzVnwZmJgTRw2O0opRV7W2TVKLvvlrhcACTN6oXTdPv9DxUhe0rXqrcWF+eLfAPdMyyemFejSPV26Z1QN+9TTjlIT9wGpMCd4BTYO5ZK4l6qVfHg7N+whhoELxYJDmSYqx0lxa1klC09xUlY99koWa8R7c4H2E26lZpc1uzCEJmPCJ5YCLxOWNE84zq+pRA37zG/1KAj4Alml/dQVXT0aRJTuZD/RSGHEjTrqWNKfpfsPJjgjg2pmiuVjv9rNQml4OJ2aOi/gui7yZf9j+2wnuaktgsQ4rGwgN5aw2B/A0bsyClo/4YRfP8c1TG/OpfGElp3lNGf2skbY+ho9YMPUV98oYNfiHaQ8872YYod6SrchvzUonFVUxzanigqP/f1e97f92yZ2BKmVafBjkMYKPaa+6uyObcYSMe3jQZuteiJEGenfdv1UA7RbXDQsVcVMz/JzkhGUfTwPpzJmDSFNI/HmrokYQMDblw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <497ABB0ED9F7724D833D1F84E9960CB7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 QHAsi2c9Z/cKGHWwq/VkAIgXpihuAtBtU7ZdosWgOD+HcMUULd/H3jojc7XWntD8PAUTcYNU6S0SugU/4CeJm+7OOEwo1MUnXsSvU/jZ4V264INANf+DY05Rmcrel+PE/k+iyh3efJSWtvImrx5Xj14wNfCR5ZfIkWGyZhhhdD6W8NQ7hm5uRoAjauAS1qWI89QyKqKLKMInpFTTpySDOyQ/UziA7FfhPy+D1Upc9MsxL5swlVPVbbjQNyDUo8s1HivJvYUb6HfRN4rPbh9xwtoh0efTDlKK8OYzhyHqRJ/f6D7KwizKEpA22gL/NxFO6C7/W6cHw2gVm16IIzIG0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8297
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	131636a8-0d01-49a8-235a-08de90d6c433
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|14060799003|35042699022|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	n4cvZA6gg0nXAdKZCwpdiwKKzbnDFGFRYYaLxUOK9xva3IXw7l1YPzIYaO/7PWYfXaUi407Lu4gSDuqyeBVAPv2/6bsAirxyv6FcRaXmGNF84RFXdSvSBgn3UL3Q8ZEasxlB19vHG+ppsmdZ/gSnvinrk1hGTPPh1QYcIaVG7Wxz9+O8WT7OmORFezW2sUZ9FZpYEwqJgHz9L6sZufSyidQAQ/sRGfud1zcXs0f4yxRvBHpIG874pCyItzQLI/55XfI6SD0iW290Sczy9p/k1n8lOr52VoLdzHv6rmMzqEqBjAUMOPPSuBU1JGLo6YlOzGWwRjJ1LGN4+D+kXsNLl1Qam1h2FsqwH5vX/T/Y7Ws0sQ/ejE+qFHPH+D8HeDFzVEu4rw884f+U7Hm4y+eGd99z38wzCH9o/1NEK9dhfN0up7Q6m+OVWFKbGoY/K3xLQHAUJZ2X6LttPrvg+M63J/514Arktp/DFQfSkyAjrXJi58uZ3HGdkLqpzYbjlkaxiZg9mSbkTyRiv5YAmleXJ/xLnBdErU0q/sXSbjZml646oyS257wqrZvwDRGRrZwLqFQkeWJuJZ25SN8nrPzBTezUTXhrbgrVN7n3TBzAWN7wzTGYMmeW76Bn3YTj7PBVfiJ+HlZeTmQJT1TZsmYrnykUyICx82fcx+MdC94ReHreNlX7q4MEOSXJtIGbG/J534J+BeHMEb2LE3SWzoQDarFXK9N2oS2S0XKSjvweXWrRzDukdAOWEhHYHZo74uKhGqRtIyiZrPslDobKC9k/LA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(14060799003)(35042699022)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sxjFfNHlkHr8mfjonnGKBUuh1MeyVwLRy3nAHL76J8GEF9SA1QwWTZEHcNWDW7P0dhHed4u0IDZILRXUnL5ySQ6zX0HkbRiwAWzacUKfj/uh4KXmHk2khEkI5RfMsklLC86N0XT2byFsSCmqko78wWRhZWhItN7fBBfrL7Z+3RzLPdzXYVXumNi67hLQYJsAQd9qJs8Loa9/j6uTsCtHIxFXPAiXTuJPocJF7Vm3FHth/go0yjpDytNAecDtXsywBSdHIHQ0pMuuWTPkikf7sL1F+54QdQqsO1W+LsftTjF2nUSxVa/aKHPJz2y+mSkMmE6h9QzE3aO/tvXXs+Rrnpdi4lCvoubVUsYmzEl4Rrvs7RpCTVfCH15P7pO7q0FZKMp5WjvqyQUGLnqvT7BKgKtsVPHzkCRTidta/DEueYB1u3WetWAfI2p7L9AJIsRh
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 16:43:05.6140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb0e0fa-2d83-4486-f3d3-08de90d6ea00
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10964
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 Apr 2026 16:43:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6999

T24gMSBBcHIgMjAyNiwgYXQgMTE6MjksIE1pa2tvIFJhcGVsaSB2aWEgbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZyA8bWlra28ucmFwZWxpPWxpbmFyby5vcmdAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4g
d3JvdGU6DQo+IA0KPiArU1JDX1VSSTphcHBlbmQ6Z2VuZXJpY2FybTY0ID0gIiBmaWxlOi8vcWVt
dWFybTY0LmNmZ+KAnQ0KDQpXaGlsc3QgSSBkb27igJl0IGRpc2FncmVlIHdpdGggdGhlIHByaW5j
aXBsZSBvZiB0aGUgc2VyaWVzLCB0aGlzIGxpbmUgbWVhbnMgd2XigJlkIGZhaWwgdGhlIGNvbXBh
dGliaWxpdHkgdGVzdGluZyAoYW5kIGlmIHdlIGRpZG7igJl0LCB0aGF04oCZcyBhIHByb2JsZW0g
d2l0aCB0aGUgdGVzdGluZykuDQoNClNpbXBseSBhZGRpbmcgbGF5ZXJzIHNob3VsZG7igJl0IGlt
cGFjdCB0aGluZ3Mgb3V0c2lkZSBvZiB0aGVtLCBhbmQgdGhpcyB3aWxsIG1lYW4gdGhhdCBhZGRp
bmcgbWV0YS1hcm0gYXV0b21hdGljYWxseSBwdWxscyBpbiBURi1BIHRvIGdlbmVyaWNhcm02NCBi
dWlsZHMuDQoNCknigJltIG5vdCBzdXJlIHdoYXQgdGhlIHJpZ2h0IHNvbHV0aW9uIGhlcmUgaXMu
IE1heWJlIGxpdGVyYWxseSBndWFyZGluZyB0aGUgU1JDX1VSSSBjaGFuZ2Ugd2l0aCBhIHZhcmlh
YmxlICh0aGF0IGRlZmF1bHRzIHRvIG9mZikgd291bGQgYmUgc3VmZmljaWVudC4NCg0KUm9zcw==

