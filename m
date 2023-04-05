Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DDCC76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 19:20:40 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.85])
 by mx.groups.io with SMTP id smtpd.web10.139905.1680722433353125456
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 12:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=35D3F1/f;
 spf=pass (domain: arm.com, ip: 40.107.22.85, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+s7pNkUkRx8pj8+ah9rWvcdvAxQvgaCfBLNm/bpV4mc=;
 b=35D3F1/fZMiSExj1Dk2eqbVi4UBOHA/kVBDI6GkmltfdKS4HRuZ3W5qD7Xbv/xfJnT4KrowQrxERlTaYqQVHPf17DViDFvsTL2hsIZN3tyjVVoV+D2U3mf5wleG9rzcW4+KjMFh9FD+oevQ6Tj9B/jcJntxIW70b+0dk1/xh8hA=
Received: from DBBPR09CA0043.eurprd09.prod.outlook.com (2603:10a6:10:d4::31)
 by DU0PR08MB8710.eurprd08.prod.outlook.com (2603:10a6:10:402::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Wed, 5 Apr
 2023 19:20:30 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::79) by DBBPR09CA0043.outlook.office365.com
 (2603:10a6:10:d4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35 via Frontend
 Transport; Wed, 5 Apr 2023 19:20:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.16 via Frontend Transport; Wed, 5 Apr 2023 19:20:29 +0000
Received: ("Tessian outbound 99a3040377ca:v136"); Wed, 05 Apr 2023 19:20:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 36424ca632c12538
X-CR-MTA-TID: 64aa7808
Received: from 92d72ee494d8.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6D31CF0E-ADA7-4211-AFBA-B655C15A5FCD.1;
	Wed, 05 Apr 2023 19:20:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 92d72ee494d8.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 05 Apr 2023 19:20:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqoa5JPvGoZGmWj5VMit8VgSbTaiFcCpfZ0hVWJOXrRR2ydnYhGZaXBEMZUM7f8s7ZDFFHVZPQvPc76/DC1KfeMjwHS+IkBnfn8jVYsppSEU35sKYxRbogmbIn3UZ17Qi+if9t3YSlmnpOmSW05NYNRgvEtjDXioNAWHWtMrC65Qr8oga4MdizT/p7OPycdGUMquGHPL3okBvwOS10Me5H5nqQVkMsnudWkZIR0q1qY8MsHt2K/WlDEheW/SlgKGp7cDQOUEEmbG0hESAhhHXmSgPJlo78BD3RdYIhAm5aAjhgnciVacgnKV881/GdGN2GWbvDxaMn1AEdRxykmDCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+s7pNkUkRx8pj8+ah9rWvcdvAxQvgaCfBLNm/bpV4mc=;
 b=CeGFK0hPJc476FmSLXvyK5gp2N8YazWSz2G6Gb42Np7DSKAff+4YgcVlgwt/Nxl8bf4Ooa9E4jCsAyWwZ7DSXzJgCkqRLm4XIaQN21leRWXNMUCb9zM+b8TjVzJSHvhTQVajp6gcSxcCqHzJjtZltqSVzQ5jjvVKMzQ2+agHjA8ZfNYzRrwDXmzjtZ3Y17HPPZMeUHalPH1Yr7MR41pMWDp+irmfbbWtVwJ0+x5Z5U4Lh44EyIP8rmNcJRwmsS8RAS1gybrtOPB66fyuyDeh1hFFcCLLwPd7bF1QB25kTtnn3VeVJCQxGMcP+B9vZZGACDt0YrTs6yIt0e2vAMJaIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+s7pNkUkRx8pj8+ah9rWvcdvAxQvgaCfBLNm/bpV4mc=;
 b=35D3F1/fZMiSExj1Dk2eqbVi4UBOHA/kVBDI6GkmltfdKS4HRuZ3W5qD7Xbv/xfJnT4KrowQrxERlTaYqQVHPf17DViDFvsTL2hsIZN3tyjVVoV+D2U3mf5wleG9rzcW4+KjMFh9FD+oevQ6Tj9B/jcJntxIW70b+0dk1/xh8hA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9275.eurprd08.prod.outlook.com (2603:10a6:10:41b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Wed, 5 Apr
 2023 19:20:20 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ba7:a556:599f:4369]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ba7:a556:599f:4369%7]) with mapi id 15.20.6254.028; Wed, 5 Apr 2023
 19:20:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Jon Mason <jdmason@kudzu.us>
CC: Denys Dmytriyenko <denis@denix.org>, Adam Johnston
	<Adam.Johnston@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>, nd <nd@arm.com>, Jon Mason
	<Jon.Mason@arm.com>, Yocto TSC <tsc@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA devkit to
 3.20 for N1SDP
Thread-Topic: [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA devkit to
 3.20 for N1SDP
Thread-Index: 
 AQHZZkML30ucqym+hEKIWGuQtS7vpq8aRfKAgACLNQCAAINRAIABCQwAgAC7csGAAAHJgA==
Date: Wed, 5 Apr 2023 19:20:20 +0000
Message-ID: <4C217F66-AD65-48CF-8850-78CC7034F21F@arm.com>
References: <20230403154306.3422-1-adam.johnston@arm.com>
 <20230403154306.3422-2-adam.johnston@arm.com>
 <20230404000559.GA9226@denix.org>
 <PAXPR08MB6432BC10804AF2B98275C3E6E9939@PAXPR08MB6432.eurprd08.prod.outlook.com>
 <20230404161414.GC9226@denix.org>
 <PAXPR08MB6432BA9D89EC85F016E440FDE9909@PAXPR08MB6432.eurprd08.prod.outlook.com>
 <20230405150847.GD9226@denix.org> <ZC3IXbJDPZYoaVHh@kudzu.us>
In-Reply-To: <ZC3IXbJDPZYoaVHh@kudzu.us>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9275:EE_|DBAEUR03FT010:EE_|DU0PR08MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: 754ae5e8-f770-4bf2-c910-08db360ad1c3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fPvNlPdxjKsY6C/TeeLdipvr0bQM0t1dcCF9lL+h4z5iu5KF6jkmSeK2i1T4Ms6vOl0QvbyksGt9rF17URcxpyodMO6YZ+DeqRwKRQUaOvzttS+FdLJQrPlNlsusXVHxlUS+y1DpJxwQ9aNKJTnVGT4sWIrMqSdAdBx5kCjC9H8mpBTmEJAuIRj5haE3nZzIOaz2ExWxsG6iCODOrvnlsmLYJPVf/dgF0ur3+hYz0f5WUxKgVtNU+Vfy+LhmWYIulF/EI8XBuLnkB4Rmfo7RfyEAKcB27qQTqwFGiDI5ZOxvCkifxDtbDzffMCSe5lGuxGYekkoF+XeUol6W0ugNlpmf0iddlisKfGXNsYfMX49Wi+jc7j0O/3id6bEtG7osO5iYebK7DlUHoih6hI0/AjSPeHxhWDqVo02yv1oJeGkLc08ioyDXUyIJtWxD0jx6XJtvHxKoMRbmpsXu4qkoSuBTbWzRPQASXj6xyHXjQPFWrX7Spv50dF+iAH6AOjHySzkjahHCMNYnwLM+WKIZqBDnzU9dUfK94hPaovxe7A0k2AXJz1pSBVgW1+1/vrMEw2g5brmHHQOyjUZJN0LiSWRxN7aLn0jx0YuLv7Y2Ajc5hgPk9sjyQf2VEgq9tLYS22wLan494pJS1E+tbhOIuNNbyKMRkNrffo5DhG40hW8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(451199021)(186003)(66899021)(53546011)(6512007)(6506007)(26005)(4744005)(33656002)(64756008)(54906003)(66446008)(36756003)(71200400001)(38100700002)(478600001)(86362001)(66946007)(316002)(66556008)(8676002)(4326008)(83380400001)(6916009)(122000001)(91956017)(41300700001)(2906002)(76116006)(66476007)(5660300002)(6486002)(2616005)(8936002)(38070700005)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AA960A0547E7345B027C3CACC68CAFD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9275
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d2a31cad-220f-45d6-d3f5-08db360acc26
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/EbUKztm7v6nhf8p+uWFgWR5m9O4U2m3dYWRuFsR2h51CZ8ed78f+7CiCIBwE4oTgR/f3hDkFbBG2jta6NKZIyIA56ciUBE9tMFR/JoKDeiu/lh/UILaHV61HLUIkoPoruYIP8dNbNQ7XBuv57/S2OOBgChfzRR9ucFPfLovsT+dDp0BrMnc7QCW5wZuTsJAmcuCO62LKHTfS9B/9XLiqhIvS9B7aZxoqoGnYPetOAmoEPlNR1QtNm8Oa5N0iCC/kIDz3UOmP78m88jx41B0l053AAf6kP5gV+Dxk47Sir6bH9Eih6PLzVsR/Xe1KgK1SpOwz3H5xE/jN304d/PIhr5KmOZdd1cDMT4TZ13u4NSQQCuPoVP3bARIoewUMEKZztXzrdiTEfXvbgi7ZE57/dh9d+yYzVdK9oHikVAxxJ4U848Jpy9tVMiG9nRuY1p3rkaFaHfhK/zlnDdm5tOezxWipn4fGNRoy3bsY7uAkFXq1CLPWx9wL2eVzLp8wFvJMEs+xa6JBSF1ZtQP+A7ulhQfmuvD1Rca3IgKxFv0gvRFPxJYZzRATeVLhblE0EIRStjHDZvHOeRGwV/FMr7O5QB4RGxxfCY7PlHNAPAcC0KYwVBPzlB+W6mMmaosFezzpLdXV2IecPaopPn5NCg+h3MgKENkIdbmelwBCN/3UaVRWCLfBH68sTBrgbc88P04KSIK7MRJQfYLc3tHKLbd/YwPf/PYhiyBroZ5dZSsDAk=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199021)(40470700004)(46966006)(36840700001)(40480700001)(41300700001)(450100002)(36860700001)(40460700003)(70206006)(8676002)(82740400003)(316002)(6862004)(4744005)(8936002)(4326008)(356005)(81166007)(54906003)(5660300002)(478600001)(70586007)(83380400001)(186003)(6486002)(2616005)(47076005)(6506007)(26005)(53546011)(336012)(6512007)(36756003)(33656002)(82310400005)(2906002)(86362001)(66899021)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 19:20:29.9899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 754ae5e8-f770-4bf2-c910-08db360ad1c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8710
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Apr 2023 19:20:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4547

T24gNSBBcHIgMjAyMywgYXQgMjA6MTMsIEpvbiBNYXNvbiA8amRtYXNvbkBrdWR6dS51cz4gd3Jv
dGU6DQo+IA0KPj4gQXQgdGhlIFRTQyBtZWV0aW5ncyByZWNlbnRseSB3ZSd2ZSBkaXNjdXNzZWQg
dGhlIHBvc3NpYmlsaXR5IG9mIG1pZ3JhdGluZyANCj4+IFRydXN0ZWQgRmlybXdhcmUgYW5kIE9Q
LVRFRSBjb21wb25lbnRzIGZyb20gbWV0YS1hcm0gdG8gb2UtY29yZSBpbiBvcmRlciB0byANCj4+
IHJlZHVjZSBkZXBlbmRlbmNpZXMgb24gdGhlc2UgY29yZSBjb21wb25lbnRzIGJ5IG90aGVyIEJT
UHMuDQoNCk15IG9waW5pb24gaGVyZSBpcyB0aGF0IGluIHRoZSBpZGVhbCB3b3JsZCBhIGdlbmVy
aWMtYXJtNjQgQlNQIHdvdWxkbuKAmXQgbmVlZCBhbnl0aGluZyBleHRyYSBpbiBvZS1jb3JlIHRv
IHdvcms6IGFzc3VtZSB3b3JraW5nIGZpcm13YXJlIChTeXN0ZW1SZWFkeSksIG1haW5saW5lIGtl
cm5lbCwgbWFpbmxpbmUgVS1Cb290LCBldGMgYW5kIGl0IHdpbGwgd29yay4gIEl0IG1heSBub3Qg
YmUgYXMgZnVsbHkgZnVuY3Rpb25hbCBhcyB5b3XigJlkIGdldCBieSBhZGRpbmcgY3VzdG9tIG9w
dGVlL3RmIHBpZWNlcyBidXQgdGhhdOKAmXMgd2hlcmUgbWV0YS1hcm0gc3RlcHMgaW4sIHdoaWNo
IHdhcyBkZXNpZ25lZCBleHBsaWNpdGx5IHRvIGJlIEJTUC1hZ25vc3RpYy4NCg0KUm9zcw==

