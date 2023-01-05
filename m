Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42539C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 15:30:52 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.47])
 by mx.groups.io with SMTP id smtpd.web10.15660.1672932642115191346
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 07:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qmaSPrn6;
 spf=pass (domain: arm.com, ip: 40.107.249.47, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3JRZRBYcYHiZPWYVZFblufIpR8FgJhaFPa+Ijf0f+o=;
 b=qmaSPrn6LXD1I3AXFYE2MXzUwJCgBqlSbyr+HaOdUYZr/mjuEApOku9bAupFtexB7OdfBS6Wh8F2Iqhn6YEWGqdPY9U5btQ9IPYum9cI3Bn/yH4bSMJdSpKfIEPhCtkcB/8Fn+j8zAD63ZzG35ixW1hD3YodTzGQMvb9jjj8qaM=
Received: from FR0P281CA0056.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::6) by
 DBAPR08MB5800.eurprd08.prod.outlook.com (2603:10a6:10:1a9::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.9; Thu, 5 Jan 2023 15:30:39 +0000
Received: from VI1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:49:cafe::6d) by FR0P281CA0056.outlook.office365.com
 (2603:10a6:d10:49::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.6 via Frontend
 Transport; Thu, 5 Jan 2023 15:30:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT051.mail.protection.outlook.com (100.127.144.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5966.18 via Frontend Transport; Thu, 5 Jan 2023 15:30:38 +0000
Received: ("Tessian outbound 43b0faad5a68:v132"); Thu, 05 Jan 2023 15:30:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a4f0286951864dee
X-CR-MTA-TID: 64aa7808
Received: from 5ae5038e13a7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F766F81A-6085-4CB2-9BFD-4F985E1CEFFE.1;
	Thu, 05 Jan 2023 15:30:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5ae5038e13a7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 05 Jan 2023 15:30:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdkBlLOyHyUQZmK4GPAL1TJVbxbnwV0bnGUdAAU2pwrTI4FyFI3hqBI5O3FAbSavuVQ/xAnRcOIGdDSWBbluQSf3qXmMjh8JsNTb1O5W4ssdn/7MNLADkaA3CHmmHtXAMSfPwhVH1GK8xL7sJWpA4hLGOkeSvfJxYIauu4EgW44aE6NkN/neDHmfJ/N+r0jvmeDlLfuHHlfYTX3xvzbz525ZMnz2vYIZqOspRQ18EUxuIwEHevVpoa3cEiRSHLcJ8epMFL8oeCaaQ9P8BAKN/2WZNqFWxUTSuUo1ErZvwLomTnpDsZPDOAYE7k4nzuLb7jUcRMMhQ21HdDWNb/LMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3JRZRBYcYHiZPWYVZFblufIpR8FgJhaFPa+Ijf0f+o=;
 b=YUMGLxh4MYEs5PiDPWIHGhhp4GW/Epqm0tFtNb9tsQU5FCNc0v77OmMejqaACKh9rRjAmT2P5muqRY1WH78M2AhrPGJcjBP26tnK7T62v2ttnG9l7trM/UALUDwVKAChZ/ZyIMYZhTPLgpeL8v+k6YF6ti23Y+nxBkZuPYd0OA7HtmNrObPSd0onpTZ3jzZHNxQcMzwGlL9KLGKSXytL3VvyWkPhp6ulWJc8SjkyTWM1Y4EMBY/46SAmdUSGfeX7QcxFoRciB06bpvZM/jys8s+Cn2cw3oL0TSsQaltHUhrAGvbuq8cF1V3/yJBFyoIlRCk5H7TmK0vN5/FxgucA2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3JRZRBYcYHiZPWYVZFblufIpR8FgJhaFPa+Ijf0f+o=;
 b=qmaSPrn6LXD1I3AXFYE2MXzUwJCgBqlSbyr+HaOdUYZr/mjuEApOku9bAupFtexB7OdfBS6Wh8F2Iqhn6YEWGqdPY9U5btQ9IPYum9cI3Bn/yH4bSMJdSpKfIEPhCtkcB/8Fn+j8zAD63ZzG35ixW1hD3YodTzGQMvb9jjj8qaM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB5630.eurprd08.prod.outlook.com (2603:10a6:800:1ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14; Thu, 5 Jan
 2023 15:30:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.5986.014; Thu, 5 Jan 2023
 15:30:14 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Emekcan Aras <Emekcan.Aras@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [PATCH 2/5] arm/optee: support optee 3.19
Thread-Topic: [PATCH 2/5] arm/optee: support optee 3.19
Thread-Index: AQHZFUofuy3zhgUlSUK3WooNTtzQBK6QCpYA
Date: Thu, 5 Jan 2023 15:30:14 +0000
Message-ID: <7DEFE610-F0A9-44D3-AAAB-2B7E7919669B@arm.com>
References: <20221221143942.15196-1-emekcan.aras@arm.com>
 <20221221143942.15196-3-emekcan.aras@arm.com>
In-Reply-To: <20221221143942.15196-3-emekcan.aras@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VE1PR08MB5630:EE_|VI1EUR03FT051:EE_|DBAPR08MB5800:EE_
X-MS-Office365-Filtering-Correlation-Id: 22221a05-0e21-4d26-37ab-08daef31cc60
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 YpO8j5YfF5lpJIfVJ1p16dZvWCIF5A5ImzU05nMkR0zUlmP9Ivct3PsD2pa6KMbhX3B64u4McGbBqTkWZwMr3+jIg1AST0LLJYDvDiaAFTYawhQRSoBirn4Y+xyku/ojG78PJyThfQIE19d7Od8O3BN2L4C93b0QvtDhLdy4asD63NPaSBZohM9qw9/g7SUZ55VWRrbV+W6VTjvKUoDkX48dUr0q3dEmiM0jzldLYmkZ+j7x20VUzk559XVabEATTimsUhOkEOkhagui584yr0KJ3oXpePcH4ESkz4TCH8I+9DSUDia1+xvvABpuiQfhpLfMNAhXY7MaFkFpuLAkg2LQSjdRdhG98LybjDsAHlircf5F/xoLLgLnWLif1K4qrE8ZTNkbhFXFnyO5jlDK0T18NpZjHPtXwsJIocRMFgyvLPeO3vyLpDETsCaIakSyHtDFeRQIkkOWXoDBG4eKFU6hiIwwGj6Jm76Pr8UV7cf8iP/Ai7uXw4yEu4RYLn/m1//K+XUUqyrWMn+zXjheXEezrLd+nAge3gujxOjaEEzLzhxkxUhuMf6azZ2adapP4SKWAaRCRQWuiHisygy/8uqQamRoH0O/G2qJg+461XyukXC/6Wxiyp1b6AD1R+HMWhn6neRpEeAFoiG0I/8oxd8mnSuzaNqNieSITjQENowQsVfVoqpyWka9bgPhP5TuBIMBEswrIGuB9hK72O5pJkLPbFnIsNuap24xfd3QQfG3OGtuKjH01u5gbwelSdjw
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199015)(66476007)(64756008)(76116006)(91956017)(66946007)(4326008)(66446008)(38100700002)(122000001)(37006003)(316002)(6636002)(36756003)(71200400001)(186003)(83380400001)(66556008)(2616005)(86362001)(478600001)(6486002)(6506007)(26005)(6512007)(33656002)(8676002)(5660300002)(4744005)(2906002)(8936002)(41300700001)(38070700005)(6862004)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D9FA82C2CC05E4CB74892A19EB09027@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5630
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3831af6a-e2e9-4ca9-945f-08daef31be03
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CXTgV/REb2bI2yjfGqo61C4zaBGBI6K/WrETxE5/+5szcDg56ndZOZpS2MEXsGLxsKPvGlM392AcvfVWDCUBQY655klipj03vT428i+4AxSn40ESms8D+PWU8jLFQtm8nG49wENPgLnoAWhXva6JncSL/vGnYJiQnh910pcHEsglJu9Nx2+uzq8st0uDTgMLwZZneiMN/jldIUcyxkMl/jsT7Xlf4qsSfKMf54RuP+iYpXM3xzuO7Q3O8AhV1A/4imre46Xzw1CgE2ildPnmYgpHomEFAV1Os9PTDhvS0KTqXmlMmEtS9Jskx7hHLRcLV/OmVxEOVyk4mUh2U3pXMvnUVK9tzR8sx0D5hFDg8I60bVOHu6Hq1KB1n3y3anQE+k1F3rOPruXLHHgvAr1JPT6l1IxtrX8ynSMDtpUHNQ/kq5Uw21DWFHeN8N1rTUfvOby+hqecj5n2teFVXc1/r85BpRurVW71ZzYeKLhc7iPrnb6ky3dCAqQIDB/BrF4mbOlCf5qkqJr84XX9aE6plLP535P9bUuctXjUJKbhCMd4zkDAgo1i15TAqGOA1Ya0TKEcmMnbmNZksiiJYFfMN3CDIkIbfSi8/EW7LB5tbTj7RjE8kfFlt2X+uGx5/I+mbBn05iKLDAckvkZgQr15JsM70P5JV6wbrTOzrYUin3E40QifLEo1agsM3NzXANLstha+EZR7pE65AaJVHF2OGXIbuLd4gZxkKVF+Ltg4J+U=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199015)(36840700001)(40470700004)(46966006)(356005)(36756003)(6506007)(4744005)(81166007)(186003)(26005)(82740400003)(5660300002)(478600001)(316002)(6512007)(6486002)(2906002)(33656002)(40460700003)(6636002)(2616005)(40480700001)(70586007)(86362001)(37006003)(70206006)(47076005)(41300700001)(336012)(83380400001)(36860700001)(82310400005)(8676002)(8936002)(6862004)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 15:30:38.6234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22221a05-0e21-4d26-37ab-08daef31cc60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5800
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 Jan 2023 15:30:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4236

PiArKysgYi9tZXRhLWFybS9yZWNpcGVzLXNlY3VyaXR5L29wdGVlL29wdGVlLW9zLTNfMTkuaW5j
DQo+IEBAIC0wLDAgKzEsODIgQEANCj4gK1NVTU1BUlkgPSAiT1AtVEVFIFRydXN0ZWQgT1MiDQo+
ICtERVNDUklQVElPTiA9ICJPcGVuIFBvcnRhYmxlIFRydXN0ZWQgRXhlY3V0aW9uIEVudmlyb25t
ZW50IC0gVHJ1c3RlZCBzaWRlIG9mIHRoZSBURUUiDQo+ICtIT01FUEFHRSA9ICJodHRwczovL3d3
dy5vcC10ZWUub3JnLyINCj4gKw0KPiArTElDRU5TRSA9ICJCU0QtMi1DbGF1c2UiDQo+ICtMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1jMWYyMWM0ZjcyZjM3MmVmMzhhNWE0
YWVlNTVlYzE3MyINCj4gKw0KPiAraW5oZXJpdCBkZXBsb3kgcHl0aG9uM25hdGl2ZQ0KPiArcmVx
dWlyZSBvcHRlZS5pbmMNCg0K4oCmDQoNClRoaXMgZmlsZSBpcyA5OSUgaWRlbnRpY2FsIHRvIG9w
dGVlLW9zLmluYyBhcGFydCBmcm9tIEZJTEVFWFRSQVBBVEhTLCBzbyBwdXQgdGhhdCBhc3NpZ25t
ZW50IGluIHRoZSAuYmIgYW5kIGluY2x1ZGUgdGhlIGNvbW1vbiBvcHRlZS1vcy5pbmMuDQoNCldo
aWxzdCBJ4oCZbSB0aGVyZeKApg0KDQo+ICtkb19jb21waWxlOnByZXBlbmQoKSB7DQo+ICsgUExB
VF9MSUJHQ0NfUEFUSD0kKCR7Q0N9IC1wcmludC1saWJnY2MtZmlsZS1uYW1lKQ0KPiArfQ0KDQpU
aGlzIGRvZXNu4oCZdCBhcHBlYXIgdG8gZG8gYW55dGhpbmcsIGNhbiB5b3UgcmVtb3ZlIGl0IGlu
IGEgc2VwYXJhdGUgY29tbWl0Lg0KDQo+ICsjIG5vdGU6ICJ0ZXh0cmVsIiBpcyBub3QgdHJpZ2dl
cmVkIG9uIGFsbCBhcmNocw0KPiArSU5TQU5FX1NLSVA6JHtQTn0gPSAidGV4dHJlbCINCj4gKyMg
QnVpbGQgcGF0aHMgYXJlIGN1cnJlbnRseSBlbWJlZGRlZA0KPiArSU5TQU5FX1NLSVA6JHtQTn0g
Kz0gImJ1aWxkcGF0aHMiDQoNCkNhbiB5b3UgZXhwZXJpbWVudCBhbmQgcmVtb3ZlIHRoZXNlIHRv
IHNlZSBpZiB0aGV54oCZcmUgc3RpbGwgdmFsaWQ/DQoNClJvc3MNCg0K

