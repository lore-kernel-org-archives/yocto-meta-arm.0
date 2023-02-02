Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FEAC61DA4
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 10:51:05 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.42])
 by mx.groups.io with SMTP id smtpd.web11.11850.1675335061260456138
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Feb 2023 02:51:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6qKdSii3;
 spf=pass (domain: arm.com, ip: 40.107.105.42, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kMax0Mg5KUytTG0ccoP/gg8PdjTyAAC7Od7pGlTFYc=;
 b=6qKdSii3uMoJBFtRqc9kku5xfEMIpB5yhqercuRbabDOCocI6uQSZrFnIx4bkNz00Pju93zFU+Z/pcCS/JNj059KEyU/6l7dqIlu5bzZCB9xCKXtq+41lzm+e43rlsVQyhBjaH04gmP7gZVU6loZ1ADBjrcm7e1XDIobwavODSs=
Received: from AM5PR0201CA0022.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::32) by AS8PR08MB9868.eurprd08.prod.outlook.com
 (2603:10a6:20b:5ac::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Thu, 2 Feb
 2023 10:50:58 +0000
Received: from AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::79) by AM5PR0201CA0022.outlook.office365.com
 (2603:10a6:203:3d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Thu, 2 Feb 2023 10:50:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT019.mail.protection.outlook.com (100.127.140.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.28 via Frontend Transport; Thu, 2 Feb 2023 10:50:58 +0000
Received: ("Tessian outbound 333ca28169fa:v132"); Thu, 02 Feb 2023 10:50:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 201fbfeb46a0cc85
X-CR-MTA-TID: 64aa7808
Received: from e8cbd073179a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B4128D7E-7410-477F-8419-241282B94BCF.1;
	Thu, 02 Feb 2023 10:50:51 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e8cbd073179a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 02 Feb 2023 10:50:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4XLIOWGSVPBBIvjbBiplj/btq+yR577ngY6Lu5Rwf4wiKmP1g/pirTgdZWs1lUFfgkAw1NYWYKzKrWF6q7dwVdmuLHqMDE466JLpBy5bbyolNQunsZzDhWpiVSh6Vy6C9QHrftwNwGzad3epq/+yimDouXa+deWAlOlSdK+wcJaZ1IOEI+fP7eUCiKXfYDIyykVbbOQbAXx9I0FXL78i1N5jSr6Ksro146Qb9E3SUhSiz/nVWW4efvlzjbU15X2R09ycfkGuAfX7BjvXrIVT5QnHVUvdsyP0SGdAzU0rd2Wi93QMmefzKVHMb1PQu9SZvDsWXMwK1jB6cq69TCljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kMax0Mg5KUytTG0ccoP/gg8PdjTyAAC7Od7pGlTFYc=;
 b=F4YhxePoImrRGcAKTxiN+rZSjXUsdjLhelVww+w/1mvJiRxGqpFYbbnD+ZEOG29yQRE908oVdomqvRljL42PoJMbNz2MNgcqm1RBPVn/qRthJjO5j9jrfrD+W0Jj8fPRkSZV2KE/mxT8Jk1t2zpxM9Nem82Lk1sytuEDtkkNYHp+6I4APJVWsQipBArnEpUEdnQD9V5nKpHsXScBa9kGfDaDiiCcvRleCYkyRMdU+2/HzeUPvlz3rpv5NiDgFv/Bi5OYjsHIzoAGUOfJCUGonIMbqxBKAWfjck7EDm1VUDvm/ibM9BCJbsHagliKKCHhz3Kw7ERaYaFzSM+Yv9TtdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kMax0Mg5KUytTG0ccoP/gg8PdjTyAAC7Od7pGlTFYc=;
 b=6qKdSii3uMoJBFtRqc9kku5xfEMIpB5yhqercuRbabDOCocI6uQSZrFnIx4bkNz00Pju93zFU+Z/pcCS/JNj059KEyU/6l7dqIlu5bzZCB9xCKXtq+41lzm+e43rlsVQyhBjaH04gmP7gZVU6loZ1ADBjrcm7e1XDIobwavODSs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5596.eurprd08.prod.outlook.com (2603:10a6:102:88::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 10:50:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%5]) with mapi id 15.20.6064.022; Thu, 2 Feb 2023
 10:50:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] arm-bsp/corstone*00: disable openssl in kmod
Thread-Topic: [meta-arm] [PATCH] arm-bsp/corstone*00: disable openssl in kmod
Thread-Index: AQHZNuvY2szC0x0g9UigRoOtGg42A667eoiA
Date: Thu, 2 Feb 2023 10:50:50 +0000
Message-ID: <2DF693A3-3D5B-47A8-9CD0-986AD2222C09@arm.com>
References: <20230202094204.3111621-1-ross.burton@arm.com>
 <Y9uHZNV3+yocmsQa@nuoska>
In-Reply-To: <Y9uHZNV3+yocmsQa@nuoska>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5596:EE_|AM7EUR03FT019:EE_|AS8PR08MB9868:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d9f441f-4bd3-4e54-bd2e-08db050b5df9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 YFxeZLlUjG8oQRdGLsGBugTIgFPp/TwzDth30yFiUAYStDK280Gg1Jj3HXV7NgNcgJHSVf2b/cxx08T/jDWo7GmxnQ+xFremK7ARF8MdG2xj9GfIQ1UV3uIQkcxYzc111YfEzHKi+jF6mAnJQgZBfzJIQy/LFPTS57LRpGzfS703ndPWtOKB2IkqqEe2KB+VO5VKaTy89gFjZuM0SnJxU4+qXSc7SlM25W3iHgD6grPFq3mAdZBGIyc/KjbzxY+n1/rJhehgPNkRDoYGrbuFhYUGa9jhA0hkqeqEBzr07vfsldbOmYcFZu+6XTqu3+kGNBm6v7i7d9k6D+sBOJpk4PwLFo2IS223NdtovSYQn2y0vTKulSzQlS/9OoJSISrZiddRhocF+NZyPn7+23ycHuX5R/RD/jKVMQ61E8FKWmAHrm/3vmDEeG/fmU4NHdh/tqQlo6KR6kmnrLwf8ChSoZwPrR6Xl9sYsm5ytpY1zA5My1v6UF3dN5ZFTLqE1ZufkJ5i8u2xaPGaFvkvLsBqC8ECl3pNjDk3WE0DqvcMlQA4Gh3gB22gUm0M2F2vD7DTClR0+pnlIFa/Jx6trVDtLPMRv4kpgLAr7x744m5LyKYoamA//hG8foIta91AIpzEe5BdZO0l3gtGdE1UeTZaSFQiEsbzKyFO3yNpUt0411ZWTkSrtxalS2LwLNlH12O8CBiiEPW5Bhx1pVtnQjGNa/PaF7PQQ8RZfo5EGhOCIns=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(451199018)(6486002)(478600001)(4744005)(38070700005)(41300700001)(5660300002)(8936002)(38100700002)(122000001)(2906002)(71200400001)(86362001)(2616005)(36756003)(76116006)(91956017)(64756008)(8676002)(66946007)(66476007)(66556008)(83380400001)(6916009)(66446008)(316002)(33656002)(4326008)(26005)(6506007)(53546011)(6512007)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E3A5139358D6C49B078C06E8820AC79@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5596
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a4a0e7bb-c451-495a-13d7-08db050b5968
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vfqdaM39VxSL1qgoP/PWCEHfBPBhnfZb8g6Yo5RSzMIKljpLkoB5bnhcNanhmYk5rj+sU6HY7gePHvaKJ9mzYlQ5T/oLr6Yg0wijHzWvUKNQWyaeT9j5JHGaVSjGIsyV0ZGZTEwzrym53ju4xEgAfVu3JHfzDalmGgK3A0TGvGVma7c82SZC+FqpG2TUnCmJH6D5rNXiJOt/uSSIMei+IoMSoUSmLtSlGUfWbrcAWLCiWkSRPXHI3fMcCtiD7lBBOvls2nmnI5IFv+IKDzDSRNfoG3QjTIL3Ckljwv7ObIQrW5DjF3PakRM8Wwc3DLG8LbHJYxVgnmQK7korgvbI8bX8J2TSLecf8xaiDj7KvgbbZd+aoWofcO9K2sdQaYr9OtQCqisnhuJVGAZpx4u9ZwvP7edQ0mr44pFdrYJCFCjKkECvgV2fhnmJmhdekfTF7wNvWHVJ8kA9+DlHX783REaryO7t1HUw3yEeDtp+1h4ejpBs9eXsWu0ktVI4IxM6twu8dbU0UMzvPToGHa25o6QjhHJdArhqMM2AprrySMR+XY/uOEqD9exW07hmLy9kWd7YMw/tyK6ZzDw6xyyqCPTnlTGaYHCuwE2F/wTQ8usL0MpVcR+gAW692l1PchI+pV0TweVuxmTAvP3St3oB3WuifGjLgBjov9vURm08bvYay8tgQIkUfh+scrtK+t94NhrfwAwvjZz3d/WTwVZavQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199018)(36840700001)(40470700004)(46966006)(86362001)(6486002)(478600001)(356005)(2616005)(83380400001)(36860700001)(47076005)(81166007)(336012)(33656002)(40480700001)(82740400003)(36756003)(82310400005)(186003)(26005)(53546011)(6512007)(6506007)(40460700003)(8676002)(4744005)(5660300002)(8936002)(6862004)(316002)(70206006)(4326008)(41300700001)(70586007)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 10:50:58.1859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9f441f-4bd3-4e54-bd2e-08db050b5df9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9868
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 Feb 2023 10:51:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4354

T24gMiBGZWIgMjAyMywgYXQgMDk6NTAsIE1pa2tvIFJhcGVsaSA8bWlra28ucmFwZWxpQGxpbmFy
by5vcmc+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBPbiBUaHUsIEZlYiAwMiwgMjAyMyBhdCAw
OTo0MjowNEFNICswMDAwLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4+IFRoZSBpbml0cmFtZnMgbmVl
ZHMgdG8gYmUgdmVyeSBzbWFsbCwgYnV0IHNpbmNlIG9lLWNvcmUgZDZhNjJlIGttb2QgaGFzDQo+
PiBlbmFibGVkIE9wZW5TU0wgc3VwcG9ydCB3aGljaCBkb3VibGVzIHRoZSBzaXplIG9mIHRoZSBp
bml0cmFtZnMsDQo+PiByZXN1bHRpbmcgaW4gYm9vdCBmYWlsdXJlcy4NCj4gDQo+IEZvciByZWFs
bHkgc21hbGwgc2l6ZSwgd2h5IG5vdCB1c2UgYnVzeWJveCBpbnNtb2QsIG1vZHByb2JlLCBybW1v
ZA0KPiBpbnN0ZWFkIG9mIGttb2Q/DQo+IA0KPiBJcyBpcyByZWFsbHkgb2sgZm9yIG1hY2hpbmUg
Y29uZmlnIHRvIGNoYW5nZSBrbW9kIFBBQ0tBR0VDT05GSUc/DQo+IEkgd291bGQgcmF0aGVyIHVz
ZSBiYmFwcGVuZCBmb3IgdGhpcy4NCg0KWWVzOiBmaWd1cmluZyBvdXQgd2h5IGJ1c3lib3ggaXNu
4oCZdCBiZWluZyB1c2VkIGlzIHRoZSBnb2FsLCB0aGlzIHdhcyBhIHF1aWNrIGhhY2sgdG8gZ2V0
IHRoZSBidWlsZHMgd29ya2luZyBhZ2Fpbi4NCg0KUm9zcw==

