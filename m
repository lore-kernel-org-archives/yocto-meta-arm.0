Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.84])
 by mx.groups.io with SMTP id smtpd.web12.5396.1588315827720429631
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 23:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=mJXrn8d8;
 spf=pass (domain: arm.com, ip: 40.107.8.84, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DJ66SN6MX3M7JxYzwRIlOzlADL4lJqPo3o4492+sXo=;
 b=mJXrn8d8IGoadRzz+6ZZH7eXMIczRZMjMWR4JV25zqUQI9PKA5kGis+3j60BtMftCb7/6HcEk9QYEfga7QuzNZajNTZepRi90xudZQQQsgAXTziIbF7vSYDhLZauUr0N4z4lZZlwqcIMeRHMu71H5AdyiP8YT/qJa3PRodwMW3M=
Received: from AM5PR0201CA0004.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::14) by AM4PR0802MB2180.eurprd08.prod.outlook.com
 (2603:10a6:200:59::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Fri, 1 May
 2020 06:50:24 +0000
Received: from VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::2a) by AM5PR0201CA0004.outlook.office365.com
 (2603:10a6:203:3d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend
 Transport; Fri, 1 May 2020 06:50:24 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT060.mail.protection.outlook.com (10.152.19.187) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 06:50:24 +0000
Received: ("Tessian outbound fb9de21a7e90:v54"); Fri, 01 May 2020 06:50:23 +0000
X-CR-MTA-TID: 64aa7808
Received: from cdec9dee72e7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D85BCA2F-5014-482A-9175-817CAC54B8BD.1;
	Fri, 01 May 2020 06:50:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cdec9dee72e7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 01 May 2020 06:50:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEe9MF9Am06bVGaGiFygNhEgRv7dK12v6wXCypzZW2WpOaTt5vWDsSZO3Kd8FUL6tkn0/N0DaoNwpUa6TK826pjUX9cD0LIhlG02zLg2BzTo22wQM511/WoyljOWpjy9fS/MHqBy9kaVAQN79KsdpdcCmpjQGeu6iiBB0xx0h4XTua3DVSeQd2SvhrDtPv/qe3IAl3F1iO1nJG6W98MyUmtGngEe7W9uV1Iot/upxoRnfmUhUbES18loZS+DqSz5RycKd/z76i2xaRcNu/pkcJjQ8lEBKWdDtQelx6fJ5R2f0UIzEQufPo7JC6f/cUSafbS+xpjWl9GHaRUhoCbF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DJ66SN6MX3M7JxYzwRIlOzlADL4lJqPo3o4492+sXo=;
 b=NK3rZqil05eKAmyQjrYMBRzgs+kkeI5huiDbRBUP8cGlXFl0mNfsaRwbYZUWmK4KiJ/wk8cA8Q/i6Qft0g6UGHvClmW5JjLQXhxi1xUKzafbiecIEm4Q0whNN4yidy1r+5GTrzPf/XtgtmTJztk7hwDA6KKLfz6otenPqUxIDxOojoX3F9Q5coUs6GvD+Qh0hhfToLebX5xNY8ELvNlja2FrZRV/Db4PkCpI9zAnXXLgQ48+KJWlH8tOQwMwHKOnZxUYIbBO9h5ycM8YTViClf/Fb0+EjWT8MjQN3rN4ZWuRlwAOIe5WAUwtSW2/S6iE9ox0/Gs5K2rNHWAxgxynFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DJ66SN6MX3M7JxYzwRIlOzlADL4lJqPo3o4492+sXo=;
 b=mJXrn8d8IGoadRzz+6ZZH7eXMIczRZMjMWR4JV25zqUQI9PKA5kGis+3j60BtMftCb7/6HcEk9QYEfga7QuzNZajNTZepRi90xudZQQQsgAXTziIbF7vSYDhLZauUr0N4z4lZZlwqcIMeRHMu71H5AdyiP8YT/qJa3PRodwMW3M=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB5330.eurprd08.prod.outlook.com (2603:10a6:208:17f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Fri, 1 May
 2020 06:50:17 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2958.020; Fri, 1 May 2020
 06:50:17 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 4/4] external-arm-toolchain: drop unnecessary RDEPENDS on bash
Thread-Topic: [meta-arm] [PATCH 4/4] external-arm-toolchain: drop unnecessary
 RDEPENDS on bash
Thread-Index: AQHWHqVRyZt8GteMAUaK8fajZyA3nKiReqAAgAFRYQA=
Date: Fri, 1 May 2020 06:50:17 +0000
Message-ID: 
 <AM0PR08MB39879C96B9897FA61D44ADD392AB0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <1588219828-34791-1-git-send-email-denis@denix.org>
 <1588219828-34791-4-git-send-email-denis@denix.org>
 <CAFA6WYPpDzS7nv6q9bqfE8rLkQba99n6bs9tMV2OK_f1U8Gs_w@mail.gmail.com>
In-Reply-To: 
 <CAFA6WYPpDzS7nv6q9bqfE8rLkQba99n6bs9tMV2OK_f1U8Gs_w@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 4e2965da-5be3-4873-89f2-11f8497ca8ea.0
x-checkrecipientchecked: true
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [188.221.127.70]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e91b5993-5494-4447-a055-08d7ed9becb0
x-ms-traffictypediagnostic: AM0PR08MB5330:|AM4PR0802MB2180:
X-Microsoft-Antispam-PRVS: 
	<AM4PR0802MB21808AFD860CA4F1D71C3FBC92AB0@AM4PR0802MB2180.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:147;OLM:147;
x-forefront-prvs: 0390DB4BDA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /qW6Pi60yZd3XbhBLH8joRNZe9gkLpvGVqn1ftXYrLIBT3RMmgrO3seBbEYIkevmaUBtrK/lqC/MZOHFx/NhP+rAveQnbWOS56gxgIvalb/KbVvBqj58vJEYqHYpNK/KQbOfYnVZfS/VRybgIY7dYrJR97BSD+lDYGzpMWQP84awBq376Z7S8T+NYwVVNT/ZidHHFBwbMTks33t/umzjJ9fqnIGDKsh260uIqqud6dqrgCA6iytAS0ljEnhljFj5i0FzBNNbPXr1LSUoWT6nam/tl4rImXaEEGo8+Dt07la/1oWki2vFwVHyxlsKLFyN9KSLMT3QqE2ZoOUxv5UvRJob94B/OtRsOpzv/HuHrNsbjqniyAUDwORJOkLVwBLgfQFFKgo87c2VDBkSi7MBwTIx9XatHDSy6FNQW3rRMFG86VHTWiCFIwtMWVYmrtRd
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(186003)(2906002)(26005)(8936002)(316002)(6506007)(53546011)(52536014)(8676002)(478600001)(55016002)(76116006)(86362001)(9686003)(33656002)(6916009)(4326008)(71200400001)(66556008)(64756008)(7696005)(5660300002)(66446008)(66476007)(66946007)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 cqm9WX8slbVXsVzuA/AWO74SacuDguo1cCAYf7ZGIj51qe/fBRD2agSRIyXaG1PEfa/15ZCBn0NOI6xOldoEHwePIrenPkbPvSVD5WevdclQfHQKdwDx+qU2tlmth9lbVkYDP06/gXcD81OF62x4rDIpvLSC3Xyt+iVHzHhymLUFlsgKzIu7fgN4E5bT46SBOSThEHe4Dyv5sCZYktsH3frmrVEggAeJ7edOodJUt1pNPwf49bnjxZt56lsuIUVfhzV2q8zCMiPY59bhilR35WQV4slVL6mORizf7BolurfkaGNbhaQe2xmVqxReOtuMI27AkhnZEPgI5Os8flQ4dFfGrqfgVx7F73NDxycrZrISdSVxgsEqoxCWZoEvSqc/ddGg2F6YFCr8IH0T/0Y98N1bOsfJ7MKp/6Zkswgs9DsidYdA0dKh/zvMh647X1EZUe7NWCKdRLjZkjPGvn4L7tEIzwqRLPjedT4FrIsw5PujbTQne1t/mGVWGwx9SuMI5WFEKqlgsty6z7w3WEtYegyj7R17i9Yp/W19adK6n0UmEAp215vez381k4ynmV+/UWTDruijAcHEx1zQOO2sVsUAqpZWG8QHbQh2fXjzcouqpyedpbyKYcGjZ/eIFO5ROb8gavwJzbDA045fKW+LVq/zM/vPWFTqzkU2GPXJSeLobDhas6gACt4vdpG8IKJ6FLZhD+JDDx4njMP5lVGIVKpXK4DFsTvStvhViAgG7ME/2xo8sYQ+dwgebxN0+S9Dd7e68gJwri+SP+KTbOazdg3Wb2OPosZZIS5mUUNw6B0=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5330
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966005)(7696005)(5660300002)(8936002)(316002)(6506007)(36906005)(53546011)(6916009)(336012)(186003)(33656002)(26005)(54906003)(8676002)(70586007)(70206006)(356005)(9686003)(55016002)(86362001)(81166007)(82740400003)(47076004)(2906002)(52536014)(478600001)(4326008)(82310400002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1ea8760f-078b-48ce-f1d8-08d7ed9be8c0
X-Forefront-PRVS: 0390DB4BDA
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vaNjp0cFocc1uZiGnYRDzhWkW99bHpmgOwZjT1/nvAvvHTXVjpCi1bSGcYAHBVKWwT/XCqtO1OoVVsH1w7Eyops/nSp54dBNtLQBbfwYUepEbURfJkEBANWaqsNykRdkldQ2DycJbEYVLd/4rOhJ6TToRXn+QynqcTTgPX8k1czvwi7a8pbo9SHc5CrEEDJepvCXnJMt2h8UeCVYlDlXMM6AkedtvwseoWoKtnFWwjQNFZB7gtt4m+3oynodLW0nTU3DvrKJn8Ck2EEstxxpen3SJ1N29ftE9brPHdYUM7jJLW7K+QTizVfpvwyb+57WKAMYsV1lNPHBQEWvmwyjSc+8f69qYLk6aBj2gEzHvSeR7511TRuxQ5rCyQX53v4dTawANN23NpWNr+uLxt7UMrrGejfl3tlPfQtZ668iAvo+uM2PSAGTOtsw/Vm5prfjzJAErbQANZooDpQ1EtqQ4cvM7fNIs9e2UOokdq3UAkNxKGUM8tOrPjThCkOVZezf/lhzaj9jf+La+UOVn5C7gw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 06:50:24.1898
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e91b5993-5494-4447-a055-08d7ed9becb0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2180
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBtZXRhLWFybUBsaXN0cy55b2N0
b3Byb2plY3Qub3JnIDxtZXRhLWFybUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPg0KPiBPbiBCZWhh
bGYgT2YgU3VtaXQgR2FyZyB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTZW50OiAzMCBB
cHJpbCAyMDIwIDExOjQyDQo+IFRvOiBtZXRhLWFybUBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+
IENjOiBEZW55cyBEbXl0cml5ZW5rbyA8ZGVueXNAdGkuY29tPg0KPiBTdWJqZWN0OiBSZTogW21l
dGEtYXJtXSBbUEFUQ0ggNC80XSBleHRlcm5hbC1hcm0tdG9vbGNoYWluOiBkcm9wDQo+IHVubmVj
ZXNzYXJ5IFJERVBFTkRTIG9uIGJhc2gNCj4gDQo+IE9uIFRodSwgMzAgQXByIDIwMjAgYXQgMDk6
NDAsIERlbnlzIERteXRyaXllbmtvIDxkZW5pc0BkZW5peC5vcmc+IHdyb3RlOg0KPiA+DQo+ID4g
RnJvbTogRGVueXMgRG15dHJpeWVua28gPGRlbnlzQHRpLmNvbT4NCj4gPg0KPiA+IFRoZSAyIHNj
cmlwdHMgdGhhdCBzdGlsbCBoYXZlIC9iaW4vYmFzaCBzaGViYW5nIGFyZSBsZGQgYW5kIHR6c2Vs
ZWN0Lg0KPiA+IEJ1dCBpdCBzZWVtcyB1cHN0cmVhbSBoYWQgZml4ZWQgYWxsIGJhc2hpc21zIGlu
IHRob3NlIHNjcmlwdHMgaW4NCj4gPiByZWNlbnQgeWVhcnMgYW5kIE9FLUNvcmUgdmVyc2lvbnMg
b2YgdGhvc2Ugc2NyaXB0cyB1c2UgL2Jpbi9zaCBhbHJlYWR5Lg0KPiA+DQo+ID4gRHJvcHBpbmcg
dGhlc2UgdW5uZWNlc3NhcnkgUkRFUEVORFMgb24gYmFzaCBhY3R1YWxseSBzaWduaWZpY2FudGx5
DQo+ID4gcHJ1bmVzIGRlcGVuZGVuY3kgdHJlZSBmb3Igc2ltcGxlIEJTUCBidWlsZHMgbGlrZSB1
LWJvb3QsIGV0Yy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IERlbnlzIERteXRyaXllbmtvIDxk
ZW55c0B0aS5jb20+DQoNClJldmlld2VkLWJ5OiBEaWVnbyBTdWVpcm8gPGRpZWdvLnN1ZWlyb0Bh
cm0uY29tPg0KDQo+ID4gLS0tDQo+ID4gIC4uLi9leHRlcm5hbC1hcm0tdG9vbGNoYWluL2V4dGVy
bmFsLWFybS10b29sY2hhaW4uYmIgICAgICAgICAgICAgICAgIHwgNSArKy0tLQ0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+DQo+IA0KPiBS
ZXZpZXdlZC1ieTogU3VtaXQgR2FyZyA8c3VtaXQuZ2FyZ0BsaW5hcm8ub3JnPg0KPiANCj4gPiBk
aWZmIC0tZ2l0DQo+ID4gYS9tZXRhLWFybS10b29sY2hhaW4vcmVjaXBlcy1kZXZ0b29scy9leHRl
cm5hbC1hcm0tdG9vbGNoYWluL2V4dGVybmFsLQ0KPiA+IGFybS10b29sY2hhaW4uYmINCj4gPiBi
L21ldGEtYXJtLXRvb2xjaGFpbi9yZWNpcGVzLWRldnRvb2xzL2V4dGVybmFsLWFybS10b29sY2hh
aW4vZXh0ZXJuYWwtDQo+ID4gYXJtLXRvb2xjaGFpbi5iYg0KPiA+IGluZGV4IGFkYjJmZGQuLmFm
NzVlNmEgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9tZXRhLWFybS10b29sY2hhaW4vcmVjaXBlcy1k
ZXZ0b29scy9leHRlcm5hbC1hcm0tdG9vbGNoYWluL2V4dGVybmFsLQ0KPiA+IGFybS10b29sY2hh
aW4uYmINCj4gPiArKysgYi9tZXRhLWFybS10b29sY2hhaW4vcmVjaXBlcy1kZXZ0b29scy9leHRl
cm5hbC1hcm0tdG9vbGNoYWluL2V4dGVyDQo+ID4gKysrIG5hbC1hcm0tdG9vbGNoYWluLmJiDQo+
ID4gQEAgLTExNCw2ICsxMTQsOCBAQCBkb19pbnN0YWxsKCkgew0KPiA+ICAgICAgICAgcm0gLXJm
ICR7RH0ke2JpbmRpcn0vZ2Ric2VydmVyDQo+ID4gICAgICAgICBzZWQgLWkgLWUgJ3MjL2FybS90
b29scy9nbnUvYmFzaC80LjIvcmhlNi14ODZfNjQjIycNCj4gJHtEfSR7YmluZGlyfS90enNlbGVj
dA0KPiA+ICAgICAgICAgc2VkIC1pIC1lICdzIy9hcm0vdG9vbHMvZ251L2Jhc2gvNC4yL3JoZTYt
eDg2XzY0IyMnDQo+ID4gJHtEfSR7YmluZGlyfS9sZGQNCj4gPiArICAgICAgIHNlZCAtaSAtZSAn
cyMvYmluL2Jhc2gjL2Jpbi9zaCMnICR7RH0ke2JpbmRpcn0vdHpzZWxlY3QNCj4gPiArICAgICAg
IHNlZCAtaSAtZSAncyMvYmluL2Jhc2gjL2Jpbi9zaCMnICR7RH0ke2JpbmRpcn0vbGRkDQo+ID4N
Cj4gPiAgICAgICAgIGNwICR7Q1BfQVJHU30NCj4gPg0KPiAke0VYVEVSTkFMX1RPT0xDSEFJTn0v
bGliL2djYy8ke0VBVF9UQVJHRVRfU1lTfS8ke0VBVF9WRVJfR0NDfS9jcnQNCj4gKi5vDQo+ID4g
JHtEfSR7bGliZGlyfS8ke0VBVF9UQVJHRVRfU1lTfS8ke0VBVF9WRVJfR0NDfS8NCj4gPg0KPiA+
IEBAIC00MjEsOSArNDIzLDYgQEAgRklMRVNfbGlic2VnZmF1bHQgPSAiJHtiYXNlX2xpYmRpcn0v
bGliU2VnRmF1bHQqIg0KPiA+ICBGSUxFU19jYXRjaHNlZ3YgPSAiJHtiaW5kaXJ9L2NhdGNoc2Vn
diINCj4gPiAgUkRFUEVORFNfY2F0Y2hzZWd2ID0gImxpYnNlZ2ZhdWx0Ig0KPiA+DQo+ID4gLVJE
RVBFTkRTX2xkZCA9ICJiYXNoIg0KPiA+IC1SREVQRU5EU190emNvZGUgPSAiYmFzaCINCj4gPiAt
DQo+ID4gICMgRnJvbSBsaWJnZm9ydHJhbi5pbmM6DQo+ID4NCj4gPiAgRklMRVNfbGliZ2ZvcnRy
YW4gPSAiJHtsaWJkaXJ9L2xpYmdmb3J0cmFuLnNvLioiDQo+ID4gLS0NCj4gPiAyLjcuNA0KPiA+
DQo+ID4NCg==
