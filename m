Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3BCC7EE26
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 11:47:39 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.73])
 by mx.groups.io with SMTP id smtpd.web10.19886.1684756050338349973
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 May 2023 04:47:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ckfTggsU;
 spf=pass (domain: arm.com, ip: 40.107.13.73, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyC7Eo6HjvJqw7VuroNhXiLg/zq55igyq9mjifjBke8=;
 b=ckfTggsUQa++dTFWwgMR+/SsKJd+aa2lPI1NqWJjPn6rQSDtTeFQkCflSAQWu879vTGF/gHwtWGXeyMh36cqqc8dFi1JPXIGhEqrLsZWgS0qhl6YjdE7u/kNOPKsKN5jw3xXCn7KPGdmZBOGy1/tk/vM5/TFjmB38shv+z2rhx8=
Received: from AM5PR1001CA0011.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::24)
 by DB9PR08MB6650.eurprd08.prod.outlook.com (2603:10a6:10:26d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 11:47:26 +0000
Received: from AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::67) by AM5PR1001CA0011.outlook.office365.com
 (2603:10a6:206:2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28 via Frontend
 Transport; Mon, 22 May 2023 11:47:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT053.mail.protection.outlook.com (100.127.140.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.14 via Frontend Transport; Mon, 22 May 2023 11:47:25 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136"); Mon, 22 May 2023 11:47:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f7311d3ea099366a
X-CR-MTA-TID: 64aa7808
Received: from 3d11be6731fe.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5693D128-0C45-4140-9C8E-79A2D11625D2.1;
	Mon, 22 May 2023 11:47:18 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3d11be6731fe.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 22 May 2023 11:47:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oy4ty8Ub+NxM8Go5w57XzkWmvl8XzgZxcNGq/apGPuBjCtLEJfWRr1fdeKL0BR/ZVI2t9vw7vlBg5MtUJTHHh101ySPRTBfolpcRXXZOvpdTZ2NAuTGfHQBkhu+WY9571BL5LAA2y7u1tLD0IgV/r34eS6bKXtm9HaLWcQdVIK6oH3hsb/t5TwiW+uy+79QIZ3fb6UnuYH5Tn/BNSOPq1mZ4iKMPcQKgbZT+e3P2DANTl+APeu6NEIgRcQWX6xJNdK/Hk7nUHNF7YrT+cDUcrYa9GWMpw7pJp09FOeTwG3wzZL/Gh2F4jomCGJVHbXy+47gUQqGcPwKH1TPWzJgMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyC7Eo6HjvJqw7VuroNhXiLg/zq55igyq9mjifjBke8=;
 b=T1hwNJ3cMONnEqB7s3ugceRMMcf0nizZiJ9fO4TxhtntFYaKR1Qk1JtcogL8STh2DvgOYnDV/Dd+WRaJ3jfN9YlEbW1HWF0FeCXe/pwYI/aid+oBi7sr5R7LnrZHGhJ/NX1PoZjJgucJpq8s04/Cq5zIFcxEfkHu9CRCEP7dKyFVkoQ3URl9tElMTNAkdle6TjaPVfEKdX7VgNf7eBHjP2HDoLuRL7vpZXXHDj4MZLLuIE0I7xIhi7/LOtN+qTxqsLtQcrRm1kJtk+Kmr+vesapqfcLlrSQC9RxIfsAkK0o42BIKQPqUHCHyeKonUVwlhil7EaFI8OXIwmTbN+qrZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyC7Eo6HjvJqw7VuroNhXiLg/zq55igyq9mjifjBke8=;
 b=ckfTggsUQa++dTFWwgMR+/SsKJd+aa2lPI1NqWJjPn6rQSDtTeFQkCflSAQWu879vTGF/gHwtWGXeyMh36cqqc8dFi1JPXIGhEqrLsZWgS0qhl6YjdE7u/kNOPKsKN5jw3xXCn7KPGdmZBOGy1/tk/vM5/TFjmB38shv+z2rhx8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9419.eurprd08.prod.outlook.com (2603:10a6:10:422::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 11:47:16 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 11:47:16 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "vvavrychuk@gmail.com" <vvavrychuk@gmail.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] setting 'TCMODE = "external-arm"' results in binaries
 without build id
Thread-Topic: [meta-arm] setting 'TCMODE = "external-arm"' results in binaries
 without build id
Thread-Index: AQHZiv29DXP8aa12C0iFHiB9UwF9h69mMEoA
Date: Mon, 22 May 2023 11:47:16 +0000
Message-ID: <9E5C482B-7B55-4EF8-A98C-6410225F77B0@arm.com>
References: 
 <CAGj4m+69bscDU+OgSEy2_=xfrNL+tbCC_P=tQtMOJtaCvar1xQ@mail.gmail.com>
In-Reply-To: 
 <CAGj4m+69bscDU+OgSEy2_=xfrNL+tbCC_P=tQtMOJtaCvar1xQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9419:EE_|AM7EUR03FT053:EE_|DB9PR08MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 789f4619-21fa-4f03-d275-08db5aba5017
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 pzpym2UFW5xaKX+91cjhDwy3nLFxt+4bxKm7TxLEF4A9xrBIbCrmu9QCQIo2w02y+K4lVsa/xQFCk2efqHxOPsZF5uEeKMAcKNBPwqZ4NFPZbjb/5cm950QaQuZFTzZzEiWQ0BVK3F/MEVHaj8pFFwGr3RIn7k9+JXsckydVBGah7oGYGUB4QIR1L8oi+o2pQKsnQ1HaQSOm2w4sdp4r/GXbZ0SEPVZsqPMzBfWTJJRBEFmtSlIj27Z3IOtk8bmCgPnxnaDqleBtcrkbjey8H/svA5R058vJaiI7jTBQ0QU+6KVIDFJ1q5lnM1gTHPRK9lI9qCP/lPBZRvaFrRiyWt020KwCDy5U+ciBnQkHcBjW3EDAkrJ5zbs/oQO4sUJvz686ypBH+twny3UZTeRXA+4gg/VqDf0wGgokD01Lx8jIZ4Om0pMDOb7sF2aFjM69RNzQt6LhLwhaIlE41YcCAW3cxp1Fo8ljdDfRoRwD+MHkxQnYwRigusYEEw9xX6KtN0C7pbtoetYAYhwtuAdYahpir7fSiTgV+RdXvkTOpe1pfOGY3Jk77NBdV/U02OxQY9hvG3Mv2mYbStOCEvgsj8wINE9jtRGQkxedrY3grW1pWdl1qYkkEMV6H9+p0J3bb3uGnsWWmKte79fdWKSSxQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199021)(4744005)(2906002)(5660300002)(8676002)(8936002)(41300700001)(66946007)(76116006)(66476007)(4326008)(91956017)(66556008)(6916009)(64756008)(66446008)(316002)(36756003)(33656002)(71200400001)(6486002)(478600001)(2616005)(6512007)(6506007)(26005)(122000001)(86362001)(186003)(53546011)(38070700005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <657FA7FDF8D5BD4EB9208DC94C399407@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9419
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fcb41140-1efe-4377-de7a-08db5aba4a85
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4Ku39xdAC938n1QGrIN4GUPcmKp+jID1DW+0TousFzvwPRwMicOyz69dsmtLoGtbieOExlXv0X8pJfb+G7copyg8Q0FC0JabyXew16EnUVbkuS1QfBIQEk42l2FHl6Vncn5R0RU9s2H8X5bxAP+b6Xvge0RfZ5Nsx3Dii0p+EirLiEZSTJs3IfYzOkk1lQBtOO3iviAhi/jfhLhG1ryENX+Lm7uTshAEs5SdscYvRzcZhA3p83Qj17/fPWfVlABubWDYr4iOmnBifSLkLZMAwqeKZ3FOSbHv0OckBRYU+/Zg7Br1QHg/6kKm6dNzEpXO+oCeX2EWNvCSzG7o4rxS8jSLsMGLar7RhQfNpcgpLSJASLgYXaMxXA8s7btf/4Z45HsA5itAqYQKwvMhQd1WHeZ26vOeJ7puSDWqlJUw8Pjpm0ceBWoGQcE/gHtxRn5O+riwTjRbdNrDtqEnn+S6z+7MkkMFttQmMg88wVr8HOTqGfBNXzsVJ1y4ALFFC8O/QMAZBtoUDuc3FWE2D20amtSO3sMLm/pc2U0S+GJW58+H687A6UjTZ0ZEMvYweHP/pZcdUIJ5q3ZuekkZcHJY2uMhGiuiHMgwLx/KUxWs0euJBbffPIPrPPfqhtERqYHpBKoIhVPIKIF7aH8PYw1CL6fXcB1USIntFm377/3+BtY0AH9pVMiF6iqurLoWAqNpSm5UzuQkobZLYjYKA8dpf8OSiw0AJIWntGqSHrckmHeVevRoAvdvlF0z/mSHhYXg
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199021)(40470700004)(46966006)(36840700001)(4744005)(2906002)(5660300002)(47076005)(6862004)(8676002)(8936002)(41300700001)(70206006)(70586007)(4326008)(316002)(36756003)(33656002)(40480700001)(6486002)(478600001)(336012)(2616005)(6512007)(6506007)(26005)(81166007)(356005)(86362001)(82310400005)(36860700001)(186003)(53546011)(40460700003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 11:47:25.6587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 789f4619-21fa-4f03-d275-08db5aba5017
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6650
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 May 2023 11:47:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4685

T24gMjAgTWF5IDIwMjMsIGF0IDEwOjMwLCBWYXN5bCBWYXZyeWNodWsgdmlhIGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmcgPHZ2YXZyeWNodWs9Z21haWwuY29tQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+
IHdyb3RlOg0KPiANCj4gSSBzZXQNCj4gDQo+ICAgIFRDTU9ERSA9ICJleHRlcm5hbC1hcm0iDQo+
ICAgIEVYVEVSTkFMX1RPT0xDSEFJTiA9DQo+ICI8aW5zdGFsbGF0aW9uLXBhdGg+L2FybS1nbnUt
dG9vbGNoYWluLTEyLjIucmVsMS14ODZfNjQtYXJtLW5vbmUtbGludXgtZ251ZWFiaWhm4oCdDQoN
CkFzIHlvdeKAmXJlIGFjdGl2ZWx5IHVzaW5nIHRoZSBleHRlcm5hbCBiaW5hcnkgdG9vbGNoYWlu
LCBjYW4gSSBhc2sgd2h5IHlvdSB3aXNoIHRvIHVzZSB0aGF0IGFuZCBub3QgdGhlIHN0YW5kYXJk
IGNyb3NzIGNvbXBpbGVyIGluIFlvY3RvPyAgSeKAmWQgbGlrZSB0byB1bmRlcnN0YW5kIHdoeSBw
ZW9wbGUgdXNlIGl0LCBzbyB0aGF0IHdlIGNhbiBzdXBwb3J0IGl0IGJlc3QuDQoNClJvc3MNCg0K

