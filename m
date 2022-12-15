Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E774AC4167B
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 16:18:12 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.57])
 by mx.groups.io with SMTP id smtpd.web11.138367.1671121082962034989
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Dec 2022 08:18:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=99nNsSg/;
 spf=pass (domain: arm.com, ip: 40.107.6.57, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABqnAlClmC1qG8B5pSHswGcMlplgRJjfc2SOUF6w9jM=;
 b=99nNsSg/2EymE2+Lc9qU9ZxZ5GBb/fyEiYIpqD9UNxMmx1hxkc0RRD70lMsxT2Yi7t9/O8qmd0eqtMAnxjg6mxwszlNtXkhQNx6VQIkO/VjpI5SCrBIWy/Oshoq1mNgo/8ItIhRDEjfiW0/YU9ZK3xvxr16n8lF8P4o3xpvZCxo=
Received: from FR0P281CA0136.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:96::10)
 by GV1PR08MB8473.eurprd08.prod.outlook.com (2603:10a6:150:81::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 16:17:58 +0000
Received: from VI1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:96:cafe::f2) by FR0P281CA0136.outlook.office365.com
 (2603:10a6:d10:96::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 16:17:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT014.mail.protection.outlook.com (100.127.145.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.12 via Frontend Transport; Thu, 15 Dec 2022 16:17:58 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130"); Thu, 15 Dec 2022 16:17:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7dad86b0bb10ed9b
X-CR-MTA-TID: 64aa7808
Received: from 8694208fb986.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0377359D-20B3-4359-A4B4-EA38D83D0A1D.1;
	Thu, 15 Dec 2022 16:17:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8694208fb986.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Dec 2022 16:17:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhLBv4kcNAyyseClN7d4YRyaGw5cootJjYHa9MHt1DyfOTJFJ0bBXz6eO2JqEzlJIAikp+oYwEY4Oq7/qd3q06M0vGw4zqrRLlsNRbS8cuGSsad8ykA4v0WM2zb+HTxSZ+A+7sSlu42TLeN5DPgrXKdpAy4CqfbnAIlqUfBKEBlYoT8+JWttC71OIeZ8V5LRtfNd2Njy+Z9M8AtrbZSzQm67+wRtZQx4Ip4RbiKqgH/zarihL+xxeMbbAJOqRG/LhtynAq28aFsn8ksNb/AopvcsM2QVvDxzdTnXTkGprhoE/TguZYl7GCZvsqbZK2h+jX2haQY+t2h4u+mgVnr0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABqnAlClmC1qG8B5pSHswGcMlplgRJjfc2SOUF6w9jM=;
 b=NVvrtmFyKRN5Ccc3SLZd9HdV+tmqhPd2bq3HxhOmcJb+xpDGSd+n44L8tma7eQCd0lDxIrme5yndacCrCoLm8jQds2rtY6Qr/ogTFpeRVMzYnQVogj7gDxQYCNkR9L+/xy9r+O32UHOUkW+PHK06Woi9Vgg+9b/aEWxFdSv4oTA5kiOPJ6bEfbDqAEdSKcqtcFfwNUI3xOVLYjFCwAN1TwkAGfJelvvq5nehi01GGyy9Q+DiCJbA66Cg206QGymTHHrdBCOqPC0Ook0RligT/JYULpmPWmN5/1zSB2GQd72SBDJ7/554x+edL3mSgnGGMicBAjQkBIoG5h++G4n1Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABqnAlClmC1qG8B5pSHswGcMlplgRJjfc2SOUF6w9jM=;
 b=99nNsSg/2EymE2+Lc9qU9ZxZ5GBb/fyEiYIpqD9UNxMmx1hxkc0RRD70lMsxT2Yi7t9/O8qmd0eqtMAnxjg6mxwszlNtXkhQNx6VQIkO/VjpI5SCrBIWy/Oshoq1mNgo/8ItIhRDEjfiW0/YU9ZK3xvxr16n8lF8P4o3xpvZCxo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8811.eurprd08.prod.outlook.com (2603:10a6:10:478::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 16:17:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%9]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 16:17:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: meta-arm CI
Thread-Topic: meta-arm CI
Thread-Index: AQHZEKDGiw3f0UU8xkGH5Ggxpm8N1Q==
Date: Thu, 15 Dec 2022 16:17:48 +0000
Message-ID: <C011CB00-634F-46F7-80FA-1B6ED9E683B0@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8811:EE_|VI1EUR03FT014:EE_|GV1PR08MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: a7684a84-fb4e-4f2d-36d9-08dadeb7ee65
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Nq+p9/Hk5l1Ojt4knYM+Yxiwc5Kgbd4enOgFvzGk7U+6WFg9MAAe0MPWp2nUNGxjBBss+vCre2Z5jbZ4K3DDGntpLJ2e6ku7Atq9n8L6b+/NDUwcmFPETc5t7quS4+HUXRLcrCZ/L+vjK+ErE4uupHFy+VCNxdv2DsfiHdfj+7hJyom0vv+ceUqIs5Ts2vr8LOdX7QY6QwO+uyTxVj2zzCLZ7+YnUwzJOSqT/yXcp1PVQOarevPLne9F3xyqMTwJMcqIeDWpTDd//+IVM4fKLY+05GqhSSTVzmN/QeSGmFzENw7K8K187FilZ56GsRxWSd5xkRagguvhxkJ6L2571eGtg+xz0HhecMBmNN2ONF3pyQ5NPMGQ6mIG5MbHFjSh1gjRg3zyWK1rvmWr+ioObFOAYEKF2OoBxc3xbU8hxqwCMhRuKlslDI7q23V1O3vWBu4MpDXJzcCklEk3KG5HpfUoSGFV3QcVkT1f5C0jzYqO8duy0LkbgczZ2uAPdaSYRyZsr7Ce6qVDzm+fPYwrVywHR6OaZZcgMwJara0twIxQie5Mz2GJTSygCEUi17OvOJwlrxLz3q3iI+LXNPmOgce7CPR3GZ72VvgMQ5f13ksUQOdAxNKTz1O5Y/n76MOYMJ/Wo3AwU77sPqSoWfy1b0nF2rTjDcZjlpaorsVzzJHawTugrgKRX5fhirpGmhvHhZiywkZZzwakVlfkUDcHPqh9kH5j5eM61y2euCFtmo4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199015)(36756003)(2616005)(478600001)(6486002)(33656002)(186003)(26005)(6506007)(71200400001)(558084003)(6512007)(38070700005)(3480700007)(86362001)(83380400001)(5660300002)(38100700002)(122000001)(8936002)(41300700001)(2906002)(66476007)(64756008)(66446008)(76116006)(66946007)(91956017)(66556008)(6916009)(316002)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1091D86D1F096643B856F17D3AF05A53@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8811
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	851120e6-6581-49db-426e-08dadeb7e881
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MnMExgWYDvuHM8dEU+tAs6+KI72eoSIcDZaUuFNzv8TtDZSRRX9mmm57hgz3DpAQ0hzH0VWgThi0CPuIRJqY32KmD4qZE8i30y4B3pTNyiSEYy25lsA8ecQKCmHMNBXZXUWBsRFFXyEWRZxhOgRML3EQ2niR5+oMVa6UDC+G6fHf4GhdBZ8TpUY/Isinl/7EgVkzdArAcjg6gK0umYlMYCx/XtoBBAyeSeo1dmzXEVSnkgGTyOZ3hMCWQM+gUt5+U14vLhJ76tRBBZG4oAYqqkpFDvj09CyLEXhn0Ha8M5k9qg5hJUT2av5XffoH21fIk73WXUlNb0IMJexEvG9S5SIlTm/5SclXWsjrcsHQau+2qDFtINZgWfFYLJN6voF96O7b9qkMTUT3nrd3GmkJ/JVFX2IjVRGNFX//inX3g/O7vftBp8rkLIpMHQE381RiQlhCX1sUKX2n4d9KIy5mrkMOMYplPqYAdTP/09AKF0HJQ3MF1uMLIYvoXgOItoB3z2543W6+WjGAyUQhoD3kaE4DmmYCvQOXKnLoGY/sNHe2/RO/8gQ/pPRe95v/yYRd3H0zCF6v6RfqtkwwEScVBrvfuJr4LsTjZUxoA0A90uTUkrp2VHSgf888CmYDfzqgMmkyR0oDFVXHc+kdc/T3CzGDsCdNgHIpX9BdXuyUDEyT/H1fhLK/E3sn0I//yQ7FTV+8KnBbsFYkxXGxUPhF/Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(86362001)(36756003)(8676002)(8936002)(33656002)(41300700001)(558084003)(6486002)(5660300002)(36860700001)(2616005)(6506007)(186003)(26005)(83380400001)(47076005)(336012)(316002)(6512007)(82310400005)(3480700007)(6916009)(40480700001)(70586007)(478600001)(81166007)(82740400003)(40460700003)(356005)(2906002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 16:17:58.5244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7684a84-fb4e-4f2d-36d9-08dadeb7ee65
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8473
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Dec 2022 16:18:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4193

SSBzdXNwZWN0IG5vYm9keSB3aWxsIGNhcmUgb3Igbm90aWNlLCBidXQgd2XigJlyZSBhZGRpbmcg
c29tZSBjaGFuZ2VzIHRvIHRoZSBtZXRhLWFybSBDSSB0byBhbGxvdyBpdCB0byB3b3JrIG9uIGs4
cyBydW5uZXJzLg0KDQpJZiB5b3XigJlyZSBydW5uaW5nIENJIG9uIHlvdXIgb3duIEdpdExhYiBm
b3JrIG9mIG1ldGEtYXJtLCBob3BlZnVsbHkgbm90aGluZyB3aWxsIGNoYW5nZeKApiBidXQgaWYg
c29tZXRoaW5nIGJyZWFrcywgcGxlYXNlIGRvIGxldCB1cyBrbm93Lg0KDQpSb3Nz

