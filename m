Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A7AC77B72
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 12:29:48 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.78])
 by mx.groups.io with SMTP id smtpd.web11.6478.1681993779509910955
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Apr 2023 05:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=BelHgU1V;
 spf=pass (domain: arm.com, ip: 40.107.21.78, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3BryAsTF2NxvosWV/laIymth89CfGmjmcx9ZMr6tQ4=;
 b=BelHgU1VCEgp70WZjf4vckuCyAzCWSLYhPub2YmPJl9AxEl2oWpI1LakL1PxgAUff6deJXuGEQoe/RIcOtpnNB3BnYUzflmZHSgkmAPqABFX404JttiNuTuieh1t2Y+4+3xYH5M/y5luzspYS1wOXfXA9qGtMB81KKwtfS/5VWo=
Received: from DUZPR01CA0282.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::17) by AS8PR08MB8013.eurprd08.prod.outlook.com
 (2603:10a6:20b:572::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Thu, 20 Apr
 2023 12:29:33 +0000
Received: from DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b9:cafe::57) by DUZPR01CA0282.outlook.office365.com
 (2603:10a6:10:4b9::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.24 via Frontend
 Transport; Thu, 20 Apr 2023 12:29:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT003.mail.protection.outlook.com (100.127.142.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.24 via Frontend Transport; Thu, 20 Apr 2023 12:29:32 +0000
Received: ("Tessian outbound 945aec65ec65:v136"); Thu, 20 Apr 2023 12:29:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0aa9847cb6905555
X-CR-MTA-TID: 64aa7808
Received: from 249cc9b69631.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8DA3110C-BE0D-4BBE-B74B-D4383293A35E.1;
	Thu, 20 Apr 2023 12:29:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 249cc9b69631.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 20 Apr 2023 12:29:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ov+sK5TreNS8fI5HMO3IDVoMPv8nqqBlZ3r/ByhJWHKjfhYtNkpv5e6W8XvJ3ntRi56BOFDneX7yB+5hmMUpDA05RT/QWsNoVIlFZz9Ca43yOr5M39hTqeveB/GE2ijiBLwmXQyJyG2pbj94rBGr+SDgJAARWDWKwd2OloTXzwkYA1HGXeGomhVKO6QhPEDtC6FUXBSpKN4MhfagdqUw672b/9ZCYYgkJsdLHvPesxlE/kFgogx4a/lgAd2g++bRWO853fe9IXWkrvPAKVrdNy8jgASz1AsxhpzRJXZd29D+spG0palTegrbkklyJqbfJ7HAkzAvXmtfsTf2X1Z5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3BryAsTF2NxvosWV/laIymth89CfGmjmcx9ZMr6tQ4=;
 b=Op99nfMyS0g/eCbovTNi1gt2Kwt/PSpHWz6S6klTYJgHdnz3uXuMi1Yo6vRlMoSFdhrZQYTq9Zhmki6eOIems1+u55q/K7m/Ax0NeO80g1qtd/TSnv+kand6/AAV0nxvrNdLoqaZgLTvp7uJDoT79NZmn0AD3rdhPAZQaUC+362deilaS3xpDCkO1BO4XSo4pJ/FuF8jELsCKClNxiteFUl/wJMRIFEcTV6PO6sF6fNl+UKDkYM3P2jDZPZ19EGPUZe/8uDhz6VrrCGPzYJj+TtKKR+Wu6zhSe2vwsacvtjgTnLm6nCeElM2SXSFJQkLGWQxZTFC4fj/FHOVtcJFzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3BryAsTF2NxvosWV/laIymth89CfGmjmcx9ZMr6tQ4=;
 b=BelHgU1VCEgp70WZjf4vckuCyAzCWSLYhPub2YmPJl9AxEl2oWpI1LakL1PxgAUff6deJXuGEQoe/RIcOtpnNB3BnYUzflmZHSgkmAPqABFX404JttiNuTuieh1t2Y+4+3xYH5M/y5luzspYS1wOXfXA9qGtMB81KKwtfS/5VWo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB9802.eurprd08.prod.outlook.com (2603:10a6:10:45d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 12:29:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%5]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 12:29:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "vvavrychuk@gmail.com" <vvavrychuk@gmail.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] external-arm-toolchain does not support usrmerge
Thread-Topic: [meta-arm] external-arm-toolchain does not support usrmerge
Thread-Index: AQHZcph1eUGD7QUnhEK09PvvyTouC680IjsA
Date: Thu, 20 Apr 2023 12:29:23 +0000
Message-ID: <20535BF4-F262-4B91-84E4-7C20FCBBC499@arm.com>
References: <5vhQ.1681745641245825165.ihN7@lists.yoctoproject.org>
In-Reply-To: <5vhQ.1681745641245825165.ihN7@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB9802:EE_|DBAEUR03FT003:EE_|AS8PR08MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 95925702-d300-4e35-6b72-08db419ae51a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 9l2w1QTd7g9bYI5iSN5aFAaOzn4UAO/7wIUnfTbxpeaAJGlwNsEaC32OTceNW3FAwYyK5oxmXwjhDPoi+XhZDGA+tecn8fJBv0bPcvDMwJNMkjamaPqiXKg73xruQbFM1ixvAmy0oeUs14ityaV7tWR8DrOraIbHhqLwQTeO19QyIO2tjfoE/5AcmeS6sgIaulb+RXsM9ywpYyuStbsRFOngH62SvXlhcylVoY1bW2vQmv30HN6sFAG+ZP+xroaEV1LbsFa+tduLRcyP2KQFIxatAA04WxNnp1gZZynsjj084SUdPXUD3utGeWF2nsLCy41qfGQhk0PX10bmm87OB2IKMp5kAfuQC9IRntQ+EIG8Jxr7wVQ94Iufg46Rnn19zy3UeRHjH4SXJotaX1Tbe1y1r3rItBDhEJheCzOKboUAkh1IzPb3RPujLTtOCiXxo5E1kf/teRcvbSXxF+ZZS6Tr3RJGz8/gK0dhB/07lVxBlv9P0ECSYVcIiArQLIIlz2udlLT9WhVwdt5HEOF6xjiszmbHb6EUtfhCvBakyeR1l75a9aCUC5a6Bta3NakIdxpAeByy+5oCYwks1u0INMRf7RNDiosFsBYsavAaC2eoQ7T2UiLLzwaxNmnG5lnbms2KM6kDN535jHBhWbV8AIRn4GuHTgM9ptC1Hwdiiuf5hEgeDVzP9gSPvjB2uwIckyBcL1nZwhwA/M9eDeFYUw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199021)(83380400001)(86362001)(33656002)(2616005)(53546011)(6506007)(26005)(6512007)(36756003)(478600001)(6486002)(71200400001)(4326008)(66556008)(66476007)(66946007)(41300700001)(38070700005)(316002)(76116006)(8936002)(122000001)(38100700002)(66446008)(6916009)(64756008)(8676002)(91956017)(186003)(2906002)(4744005)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFF487534E89CC489CF338F4A3034746@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9802
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1d937416-330f-4063-305b-08db419adfd5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UeVjvrhsPUFi22kQ6HcyR4MLLXtLE5fquKshkOWq/P1qkoAF9IJ9OLzo8CFZaF56tQL/7cgJTJKXtZoWxh13rgA1Bn6pUg60PHb9YkaLDmsvIl7OJmnNeCpQuVwO0i28W7gFR2cJ49+CLora4dq2Rg84sDc5sh0TBoQDsIBT25Mr5yxghIO4zWmMmzJh+RN5WOqOkYoMH+6xEqHM0OMqIoAY1VsV1dYlGvT1Yv1W+ftmf1Q1B1EbKKe23FUS1TeQp+Oz6Y4i5JH2pFd9pn24u0iFR4aQokwSm+MzHtAyFXUBQAP3DOayEG06SJnFtcl2I8SA/HRZ5nbMKi63a2Am7Dx4itI2CuFcpY+eq32lXVpCDCMOiBdNbYKHfj33mN1cNvQYs9r3LsM2pwj9rcYRe+nGLIWyu5jxDSidKIctegyTL2dq39OO42+goJMcAVqaNW62MWEZgV0C9RAOxW1imx0KrVhMmKoW4zZgU/ZVYp8Rfv/IsslGgv0HRAGW2gHyHtrGRRLY4Ch4WrUA1J8EssPlcfZbhT0rdh2RNmldX+2XoJltsKjvVm6p2MPiqYpMv6vZNzMTEh4tehbTRx0B7Qxw2ebCyQstQmDFgZMmayfIDnUx4pv4JTYZ1nb0FB0StPinvVKPDnUh1P29uOiz8GCFLUWVpffgWKS63AwrZNPgw+XJwWvkcLiOXlJNy1V0zUElg5Jqsq9gPiJYeCJc3w==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(36756003)(33656002)(53546011)(4326008)(70586007)(316002)(70206006)(41300700001)(6486002)(478600001)(6862004)(5660300002)(8676002)(8936002)(82310400005)(4744005)(40480700001)(2906002)(82740400003)(86362001)(356005)(81166007)(336012)(2616005)(40460700003)(6506007)(26005)(36860700001)(47076005)(83380400001)(186003)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 12:29:32.7383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95925702-d300-4e35-6b72-08db419ae51a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8013
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 12:29:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4590

T24gMTcgQXByIDIwMjMsIGF0IDE2OjM0LCBWYXN5bCBWYXZyeWNodWsgdmlhIGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmcgPHZ2YXZyeWNodWs9Z21haWwuY29tQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+
IHdyb3RlOg0KPiANCj4gZXh0ZXJuYWwtYXJtLXRvb2xjaGFpbiBkb2VzIG5vdCBzdXBwb3J0IHVz
cm1lcmdlIGRpc3RvIGZlYXR1cmUuIEl0IGZhaWxzIG9uIG9uZSBvZiB0aGUgbXYgY29tbWFuZHMg
ZHVlIHRvIGJvdGggbXYgYXJndW1lbnRzIHBvaW50IHRvIHRoZSBzYW1lIGZpbGUgaW4gY2FzZSBv
ZiB1c3JtZXJnZS4gSSd2ZSB0cmllZCB0byBmaXggdGhpcyBidWlsZCBlcnJvciBieSB3cmFwcGlu
ZyB0aGlzIG1vdmUgdW5kZXIgaXNybWVyZ2UgZW5hYmxlZCBjaGVjaywgYnV0IHVuZm9ydHVuYXRl
bHkgSSBnZXQgbm9uIGZ1bmN0aW9uYWwgdG9vbGNoYWluLg0KDQpZb3UgZG9u4oCZdCBzYXkgd2hh
dCBtdiBjb21tYW5kIGZhaWxzIHNvIEnigJltIGd1ZXNzaW5nIGhlcmUsIGJ1dCBpZiB5b3Ugd3Jh
cHBlZCB0aGUgbXYgY29tbWFuZHMgdGhhdCBtb3ZlIGFzYW4gYW5kIGZyaWVuZHMgZnJvbSBiYXNl
X2xpYmRpciB0byBsaWJkaXIsIGRpZCB5b3Ugd3JhcCB0aGUgZW50aXJlIGJsb2NrIGluY2x1ZGlu
ZyB0aGUgcm0/ICBPdGhlcndpc2UgeW914oCZcmUgZGVsZXRpbmcgYWxsIHRoZSBsaWJyYXJpZXMs
IHdoaWNoIHdvdWxkIGJlIGEgcHJvYmxlbS4NCg0KUm9zcw==

