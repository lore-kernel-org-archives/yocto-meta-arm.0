Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E00DD37490
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 13:39:05 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.78])
 by mx.groups.io with SMTP id smtpd.web10.48552.1729172339366238327
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 06:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oOduEbh5;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oOduEbh5;
 spf=pass (domain: arm.com, ip: 40.107.103.78, mailfrom: gyorgy.szing@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wMIv9y19kiaKzOmdJOk0p2k2RYt5FeUoDSO7XtZfZDigiiiAk1pnHkIMPv1nsmxllwpqcfyR1RLVw8GELWPuuIifigQE3RI1Gnz6ynLcCIlPahW8wlMRaLtf//A5hES2eQK23GQXQBI8KhxuwdysDnztz8wqb/fPH724azcvxLLeeoRk8MoDpzHpPm7umVW70S6nOYk1Z3w3tvAh0cx/DLPThYvZmu0fHs0Ld0EiUyBoEqnZwuaU15pg6nUtHAMVqsSEF0gfY+a4K7Y0YFrz5b8ARTjqtUWFhvjr/J/Y6U/u9mltYVAfvJEJKcoRUxerwi8zJhtfEwg1ywa1FKP6wA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6m65Jond+xiIwcGtF03RLXbBFEhHopdeG6ryntM405E=;
 b=szJIllR3tIPvo8d+B4NO8XBERNij94Ug3HE9rZsa8YLeu4bXqJn+LSJ1HrBOPhzxJfFXPv9QD53JedqoMOl/LZaFy61caiv1YZ4Gn5NCnWdLBhg15VauKxhkrcwHKRTvU0WsWu91UKtdxez+pCAgjH0ZnN/vSsuHMU6ggqeCA+53q1pWzv2HxPcGDvi0LHbyAvKWpr+fd4uvSc5YnVkYTujH5NQw5K3zqSu4dP7MYeraaDLfnbekMwo8UtZVZSEc7e7AaonP5M+iKnaTp0k3INU1rraMkVLAwds08P8xxd1a/MEWYYtO2uOG8w3y5P2wRPyrHYIf1puPsG64tT/PIg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6m65Jond+xiIwcGtF03RLXbBFEhHopdeG6ryntM405E=;
 b=oOduEbh5fekWhNA+DJ8oTYkVG9IGPaxOr6waOuY27fM353edgoqUGeJjTWHIDYwt4aAUH7kobcy2SEurnNsu3+2tuihHmH1sqq+0E9hh/kwcZcirZJJZt0wSGDelvn8f1mrYFnLLwmD+Cs7Ix6yGL38XZeABdlPJxYfJfPGeQOg=
Received: from DUZP191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::10)
 by DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Thu, 17 Oct
 2024 13:38:53 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::52) by DUZP191CA0013.outlook.office365.com
 (2603:10a6:10:4f9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19 via Frontend
 Transport; Thu, 17 Oct 2024 13:38:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8069.17
 via Frontend Transport; Thu, 17 Oct 2024 13:38:53 +0000
Received: ("Tessian outbound 5e8afd4f8faf:v473"); Thu, 17 Oct 2024 13:38:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 60bee18177dea316
X-TessianGatewayMetadata: hqRs5Y5edCAlhubZu0Y/ZPsc2xzwz2mcL8MCYihIOTtmH/XPko/F+AKD0f3n/FKA9oZ0RU/mdIb+yB96yBDp3skp5jiopP5Cvf+gxTUr3sIpI/BoaWXhfvRzc5thNwAmkRCZ9oRO2Cz+1OsrGGIb0oFyCpLSzMFP5/K7McR7C1e2a3uPQMBN2qaV8E9jeK4Yjziur5KTf+mtGl6g3F/Dxw==
X-CR-MTA-TID: 64aa7808
Received: from La9f6322a89ae.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 59905839-493B-457C-84A6-B7231AF468B9.1;
	Thu, 17 Oct 2024 13:38:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id La9f6322a89ae.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 17 Oct 2024 13:38:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQ0gTzIvXPodIjxVSY1uP+uS8qhaFakvPnClmlKLs8FapMOgRuIrIWi0RP3+z+8lKLJYtaN4eEivg7/ySSLgaTlV2rHCCbyty3kI7cDuYnjxHm/PIXkqmJ6yMvicr5wSyjj5efSoozB8rwxiEBEgPApDjvYM+ZXalBhyAnogDzaq46WkzR3dOasFAmwgTkRZlEC0mbvPFubAYTn6X8tboj0c1D4pUi03+7EzpmrBEt2IOQ52b8MB1SS/Zw/Uu9pNDB0E4oD76Y/49hlKGOgdlT+MVoJ6PdrRVOki+WtXTzqgn5sZkxAFJEvuvSpBugA7ehkDwFNMN0xxjw/mxYrqlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6m65Jond+xiIwcGtF03RLXbBFEhHopdeG6ryntM405E=;
 b=oXC4C0iisezRUMJK/zUHe+1rzfWYuDXJWUNyQO0KdJE+4knN+qahcgLa2ToeGXcy8XQcSYnbHWPA0mmp4i/Amimb8Vt7cT1DqOX3KxKLoTzDm4FixHWo2X893uMLq1nU0ZLzkLx7oqchi1JimQuku6Wchd0l0XyDOMFi1QT4aTBeod64peGCFeY1fdgJ5Vu0DIwT/wVeucGogS64XeenT4VYU0O3FOKhyGs3NfUmLcgbp7oYxhRip2Q08KhR42ZOakW3HJ2CAG3lvInFcfI9/aSPEr+ZsmAQcvKc/v48ZzOF3nk/mc4y29DoecQBHdTAD0CCMxjHPF7dPbnf/4FBfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6m65Jond+xiIwcGtF03RLXbBFEhHopdeG6ryntM405E=;
 b=oOduEbh5fekWhNA+DJ8oTYkVG9IGPaxOr6waOuY27fM353edgoqUGeJjTWHIDYwt4aAUH7kobcy2SEurnNsu3+2tuihHmH1sqq+0E9hh/kwcZcirZJJZt0wSGDelvn8f1mrYFnLLwmD+Cs7Ix6yGL38XZeABdlPJxYfJfPGeQOg=
Received: from AS8PR08MB5895.eurprd08.prod.outlook.com (2603:10a6:20b:298::16)
 by AS4PR08MB7408.eurprd08.prod.outlook.com (2603:10a6:20b:4e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 13:38:43 +0000
Received: from AS8PR08MB5895.eurprd08.prod.outlook.com
 ([fe80::bac5:353d:9e15:e4d8]) by AS8PR08MB5895.eurprd08.prod.outlook.com
 ([fe80::bac5:353d:9e15:e4d8%5]) with mapi id 15.20.8026.017; Thu, 17 Oct 2024
 13:38:43 +0000
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH v3 2/2] trusted-service: remove optee udev and
 group settings
Thread-Topic: [meta-arm] [PATCH v3 2/2] trusted-service: remove optee udev and
 group settings
Thread-Index: 
 AQHbIGJjaIhpu//Lm0aPbjb1+Fzi/7KKmFWRgAAFrQCAAA3wIoAAB+IAgAAJQFyAAAwqgIAAI15C
Date: Thu, 17 Oct 2024 13:38:43 +0000
Message-ID: 
 <AS8PR08MB58953407571408238734521D91472@AS8PR08MB5895.eurprd08.prod.outlook.com>
References: <20241017065907.172504-1-mikko.rapeli@linaro.org>
 <20241017065907.172504-2-mikko.rapeli@linaro.org>
 <AS8PR08MB589563A608DE289457643CA991472@AS8PR08MB5895.eurprd08.prod.outlook.com>
 <ZxDMGLYsOSe9rPFO@nuoska>
 <AS8PR08MB589512524CBB7BFB377101C391472@AS8PR08MB5895.eurprd08.prod.outlook.com>
 <ZxDeZvHXRUmITGKd@nuoska>
 <AS8PR08MB58951A0CBE556C313695963291472@AS8PR08MB5895.eurprd08.prod.outlook.com>
 <ZxDwXeOdfwuCsI_p@nuoska>
In-Reply-To: <ZxDwXeOdfwuCsI_p@nuoska>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS8PR08MB5895:EE_|AS4PR08MB7408:EE_|DU2PEPF00028CFF:EE_|DB8PR08MB5481:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e50f913-696b-4895-e450-08dceeb10a7a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|8096899003;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?OAbQr/Cn7J5TiZPsFuutbzv/tHd/yI+Ycxui6ya/kKjqD+JUEucYIHfNYlal?=
 =?us-ascii?Q?cNuXtBp1SAf6Uh+AavCTBR8Kn0q4E2cPxe27BEjak3AL7xo3lZzvl/0Wtuhz?=
 =?us-ascii?Q?USqBn3nmvFZpWm3HOmugpyRJccBzA50MjEkCd4sSwMc9lDuTd08hqBrzWdph?=
 =?us-ascii?Q?HQ9ktkB9iFOx5NWOjtOfNCmqCr/CfkWC1rpsFOCHI/csbIczJ70bqY83Bm/U?=
 =?us-ascii?Q?lVJvVGNwWHqtLeoyqdTJhegf1w5QPU0rlxi9FqGcumqYhduyHiUTGjYPGqIp?=
 =?us-ascii?Q?3h7Dhwdicm+1faM0eFqD6e0iZTMqNYae01/4+joDeN4ptJQU7VYQqFIKZxB0?=
 =?us-ascii?Q?yrQYV3fFWEUI3S6S++ib81/n9t8CH9h14Pn25nbskuah5wqsfK2f7SY1o7jf?=
 =?us-ascii?Q?wH9YZLB1pln+xpEli8vNInAhcobHhsBlZ2Gu70PjhreGGUjNp2nAFeUskhwJ?=
 =?us-ascii?Q?y4iGuLPgCJXnL8cTSSE0qfenXEszwr4gAhF38HgrFzjHUkCFTwnPTkvb0jAp?=
 =?us-ascii?Q?UCc3OTYTz/yIwaGUOXJ7wS1fCxA8UIYwo/3SmzTJGhgOkfoervVq63ogJxq/?=
 =?us-ascii?Q?/aaHTFcUdznvzw9I6tPMGEotXxlXLvZqxdsgd8JMgROKUmNosE+Z1prlBK8v?=
 =?us-ascii?Q?Ur1P1X61928An8daJbM17OJZ7NNqo+VFh67iowfZfBb8UM9HPYp2qszboY9j?=
 =?us-ascii?Q?yfyzvL0phyfrAajQRnqrSF+VJuzqJxGOEqdg5CXAEJYn7yG0lVZZwL6TR8Og?=
 =?us-ascii?Q?zDEYkgXdYTFmY8pBBMuxUBDTiY1s9PHlm3oXHVkpdgkHaAhGeXKJBgRcx/A7?=
 =?us-ascii?Q?tlg3yGzpf/53asqMmZIofQ29tqYBq8woE94wevoSJtx9vDdmfyxMX04dbLCl?=
 =?us-ascii?Q?s2brAC/PYlA50r3WNd1WrlBMwzN1YHzVFGl+xgU6RzIWyQHrOYqCkvUcmnfT?=
 =?us-ascii?Q?KmJq+3SNN3LPIfy2LQodO6e/RELAq8HYucEbqUsLNkNJX7w12whqGqqMkvId?=
 =?us-ascii?Q?PJvLaDzArzn7CSTAJHbq6G9VLhvBAnUML1beysaAQdyAmoqEw4lADcCNPZdJ?=
 =?us-ascii?Q?Q1Puwm8uglsn0KZG0WtNFE8xz5x7z7pr9T+dKXN4T+F49BV6tbNlQeJLYqf+?=
 =?us-ascii?Q?8+l6hk/PR+hBY8zuujYDuAUjFBnjfyl6vPjeDWp6ZXJy0So+l2ENqx6bMTml?=
 =?us-ascii?Q?kROiq0uHAUSV3GFx3MjDpxCdVPHJt+SxV/LeOdOXSEOzeYE59LRPM4ThwxQ6?=
 =?us-ascii?Q?S6uBDe2zyWOTiHftv3rMkzhlCeqNWTEEyRIG+2SnWdN1XDh/jHDStTfmTT78?=
 =?us-ascii?Q?yf6ACANmYBtsBT9GvDiW7oyCWfXrxrk4XGgnsM5RaVRcwAOPuSXDYAWNtbm+?=
 =?us-ascii?Q?H5lZ01I=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB5895.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(8096899003);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AS8PR08MB58953407571408238734521D91472AS8PR08MB5895eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7408
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:20b:298::16];domain=AS8PR08MB5895.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f18de63e-d8a3-47ec-0ed5-08dceeb1047e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|35042699022|82310400026|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?Windows-1252?Q?+B1O90tRIf3seIvktE8c2A0QSD5kfpB0Wnk/LvCasTfmbP1mjtdC8sMm?=
 =?Windows-1252?Q?4KUW6Ff38+rUnVSE3e2ph7/rONMBIer4BT9YxACwQr0wy1eWhCmMkFKE?=
 =?Windows-1252?Q?iaylH7/z5njQWaBlovjMkmkYvBHQL6gBHJOj2b0Zy+ncvQnzYWLtBbdE?=
 =?Windows-1252?Q?aCnq5LKip6amErT9xevaLJmqoZ/PUzfQBqWwVVB8sA1T3mkcuXIAcTkO?=
 =?Windows-1252?Q?PadgoFUJDmTB0JAtYofOsHc7vMx3gCIG46hnHp6BO2df/CoGVQTB1QQv?=
 =?Windows-1252?Q?XTCsHH6eCVdzg8jBHzp9BRC6W1MJzvNozytaJmLibTiUdJjeSrpTUDaj?=
 =?Windows-1252?Q?69+BXDDMtUYB0+KVuf/IQOSMVA+VJslz3JeBm6PW4KenGPfnFsmKjAtn?=
 =?Windows-1252?Q?OQgA5DcUr/lVzFtJNbMu7eIDaAHG42ug9U1QS1+KqDREHg8nIrWNrTIR?=
 =?Windows-1252?Q?vsKyxnHcQWx0jglmRI0ZZo5N7IyejaLhJ/eCURrCLL6tkIRfWwh6vHvk?=
 =?Windows-1252?Q?LjOwGEBM/FKDSo7iZtcbeBUtElakC48LSdn8SqmLTPYX2Pl6dTI2GlQQ?=
 =?Windows-1252?Q?i5/zC567QY4Lfw9zwcKr6QOh6Lq3DMKFBcjnp+QpSCjO5N71q189INrG?=
 =?Windows-1252?Q?Vp5uPmzLi4Yebju5wCOyv9TzHNnqAJxYYZvf8SGGG6K25h01Rx/MyEk5?=
 =?Windows-1252?Q?OARIYE0rKefIWvjfK9m2JsNdQL4nUB6ZDHoxCUfq6u1rDgaFAy+WWdoV?=
 =?Windows-1252?Q?0DYGFyQvZrE1JLPE8Mfn2ZPN/w7rslNZC5IdF2Ov8f+5m0BD/rNUKZUV?=
 =?Windows-1252?Q?Ig/VA3NS7vDIDJv6aKbTCkBFLplosZ3eK0qiZX6ASge0q1YgkFNhJEiT?=
 =?Windows-1252?Q?z7rzUP/7T/pji7AWqaXLuQhgvvQITgF60wcKvEchcnl+gI1z+yi1RvGh?=
 =?Windows-1252?Q?04Xbn54hPzrgza0CAFScZ8QDNjBiNOb+OYXapQmHfPxyUdMTE+GuC2W8?=
 =?Windows-1252?Q?tK2eTcp4HhWk75riT833woEtHoC7IdOL4xsGBMOf15TLNXuSP0v5erhc?=
 =?Windows-1252?Q?iOUa2vo6ndlFRTTZ+sZvTuloN9/pRbJJSraZ5COISdOdPYdnn/P2CuKW?=
 =?Windows-1252?Q?xX7bVWTFGVIgotsY1Dmy0b0XqVXfSsAelnrmeHdfSIGHw0k/P+UwDhyK?=
 =?Windows-1252?Q?rX1T4u63ApUGAHTW33bzdupYdQGWKwrLiVtaKuD2RRDp4m8e8b52yuac?=
 =?Windows-1252?Q?zCXq/axsETRH5rhcQ88VZDj6W8gGlmEIXinqBt+Hq27qoKOA+ASUnnIl?=
 =?Windows-1252?Q?svwHAmS/weMMNSt+PwA460XP9jcPl4RO8Qe6tuIPiLZ4MstJYWeXE7+H?=
 =?Windows-1252?Q?rNGdofnesobF4x/s43ohCTA9mjhkdBLqAzpf8fkexbzSUq68igbxxVOo?=
 =?Windows-1252?Q?ZZ7gy2bb0fIngbbQ/+2tfFBDzXffOwEh8zR8Pq3VrY4P+7+3d9GHNJS8?=
 =?Windows-1252?Q?L9vhafJwriMA5pHoek1UoTEfy2l2Qg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(35042699022)(82310400026)(8096899003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 13:38:53.2215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e50f913-696b-4895-e450-08dceeb10a7a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5481
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Oct 2024 13:39:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6211

--_000_AS8PR08MB58953407571408238734521D91472AS8PR08MB5895eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable



On 2024-10-17, 13:09, "Mikko Rapeli" <mikko.rapeli@linaro.org> wrote:

> Hi,
>
> On Thu, Oct 17, 2024 at 10:54:41AM +0000, Gyorgy Szing wrote:
> > Hi,
> >
> > =93But optee and optee-client are part of the TS images and configs so =
there is a link.=94
> > =93I don't see any user being added to the previously used "teeclnt" gr=
oup. So which non-root users are there? If the users are in Cassini, I have=
 proposed fixes there.=94
> > I am not saying the TS recipes are perfect and there might be a depende=
ncy, which is an error. Except for the OP-TEE SPMC tests SPs which indeed d=
epend on op-tee and xtest.
> >
> > =93What is the proper way to fix this?
> >
> > I don't think duplicating optee/tee-supplicant udev rules is the answer=
.
> > I could move optee-client recipe udev rules to a separate binary packag=
e
> > to enable installing without tee-supplicant.=94
> > I think a dedicated recipe on which both libts and optee-client depends=
 is one way to fix.
>
> A dedicated recipe is not ok. optee-client upstream provides the udev rul=
e.
> A dedicated binary package from optee-client for the udev rule could be
> created. The udev rule and matching systemd service (and possibly sysvini=
t
> script) are non-trivial to setup and thus in meta-arm recipe some aspects
> were wrong and other Linux distros have even more issues. Thus it's bette=
r
> to collaborate with upstream when setting them up.

Op-tee client up-stream providing the udev rule might be a wrong decision b=
ased on you highlights of the complexities and the conclusion, this should =
be managed in sync with distros. Does this mean Yocto (a distro) should pro=
vide its own solution and only use op-tee client up-stream implementation a=
s an example. Also, the optee-client up-stream implementation might be tail=
ored for the op-tee integration system (op-tee build repo).

>
> > =93But I'd like to see the users and have a test case, preferably in me=
ta-arm.=94
> > Well, I cannot provide a setup where TS is used without OP-TEE currentl=
y, but your config can and will be tested in the CI. Yes, TS only world mig=
ht still be broken, but the change at least would make a step in the right =
direction.
>
> I'm still not sure of the right direction. Which recipes and layers have =
userspace
> SW which needs to access /dev/tee* or /dev/teepriv* devices nodes without=
 root
> rights in userspace? Where is a test for these recipes or functionality?

Any platform deploying Trusted Services will need access to /dev/tee*. Plea=
se see the recipes not starting with ts-sp- prefix under meta-arm/meta-arm/=
recipes-security/trusted-services.
TS is currently deployed on base_fvp, qeamuarm64-secureboot, n1sdp, and Cor=
stone100.
All of these is using OP-TEE SPMC and deploying optee-client. There will be=
 platforms using Hafnium SPMC and TS, and not deploying optee-client.

You can find the test here: meta-arm/lib/oeqa/runtime/cases/trusted_service=
s.py

> The old teeclnt setup was a bit broken. For example tee-supplicant was st=
ill
> started in systemd service file as root user. Both /dev/tee* and /dev/tee=
priv*
> used the same teeclnt group which was not right according to upstream,
> they need to have different groups. Then the systemd service which did no=
t
> work in initrd. Etc.
Great you fixed this.

>
> Cheers,
>
> -Mikko
>

--_000_AS8PR08MB58953407571408238734521D91472AS8PR08MB5895eurp_
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
areast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div id=3D"mail-editor-reference-message-container">
<div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">On 2024-10-17, 13:0=
9, &quot;Mikko Rapeli&quot; &lt;mikko.rapeli@linaro.org&gt; wrote:<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; Hi,<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; <o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; On Thu, Oct 17=
, 2024 at 10:54:41AM +0000, Gyorgy Szing wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; Hi,<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; <o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; =93But op=
tee and optee-client are part of the TS images and configs so there is a li=
nk.=94<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; =93I don'=
t see any user being added to the previously used &quot;teeclnt&quot; group=
. So which non-root users are there? If the users are in Cassini, I have pr=
oposed fixes there.=94<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; I am not =
saying the TS recipes are perfect and there might be a dependency, which is=
 an error. Except for the OP-TEE SPMC tests SPs which indeed depend on op-t=
ee and xtest.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt;<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; =93What i=
s the proper way to fix this?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; <o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; I don't t=
hink duplicating optee/tee-supplicant udev rules is the answer.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; I could m=
ove optee-client recipe udev rules to a separate binary package<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; to enable=
 installing without tee-supplicant.=94<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; I think a=
 dedicated recipe on which both libts and optee-client depends is one way t=
o fix.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; <o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; A dedicated re=
cipe is not ok. optee-client upstream provides the udev rule.<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; A dedicated bi=
nary package from optee-client for the udev rule could be<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; created. The u=
dev rule and matching systemd service (and possibly sysvinit<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; script) are no=
n-trivial to setup and thus in meta-arm recipe some aspects<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; were wrong and=
 other Linux distros have even more issues. Thus it's better<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; to collaborate=
 with upstream when setting them up.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Op-t=
ee client up-stream providing the udev rule might be a wrong decision based=
 on you highlights of the complexities and the conclusion, this should be m=
anaged in sync with distros. Does this
 mean Yocto (a distro) should provide its own solution and only use op-tee =
client up-stream implementation as an example. Also, the optee-client up-st=
ream implementation might be tailored for the op-tee integration system (op=
-tee build repo).
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; <o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; =93But I'=
d like to see the users and have a test case, preferably in meta-arm.=94<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; &gt; Well, I c=
annot provide a setup where TS is used without OP-TEE currently, but your c=
onfig can and will be tested in the CI. Yes, TS only world might still be b=
roken, but the change at least would make
 a step in the right direction.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; <o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; I'm still not =
sure of the right direction. Which recipes and layers have userspace<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; SW which needs=
 to access /dev/tee* or /dev/teepriv* devices nodes without root<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; rights in user=
space? Where is a test for these recipes or functionality?<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><br>
Any platform deploying Trusted Services will need access to /dev/tee*. Plea=
se see the recipes not starting with ts-sp- prefix under meta-arm/meta-arm/=
recipes-security/trusted-services.<br>
TS is currently deployed on base_fvp, qeamuarm64-secureboot, n1sdp, and Cor=
stone100.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">All =
of these is using OP-TEE SPMC and deploying optee-client. There will be pla=
tforms using Hafnium SPMC and TS, and not deploying optee-client.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">You =
can find the test here: meta-arm/lib/oeqa/runtime/cases/trusted_services.py=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; The old teecln=
t setup was a bit broken. For example tee-supplicant was still<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; started in sys=
temd service file as root user. Both /dev/tee* and /dev/teepriv*<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; used the same =
teeclnt group which was not right according to upstream,<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; they need to h=
ave different groups. Then the systemd service which did not<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; work in initrd=
. Etc.</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Grea=
t you fixed this.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; <o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; Cheers,<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; <o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; -Mikko<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_AS8PR08MB58953407571408238734521D91472AS8PR08MB5895eurp_--

