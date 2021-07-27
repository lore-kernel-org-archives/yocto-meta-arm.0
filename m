Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.75])
 by mx.groups.io with SMTP id smtpd.web12.4043.1627404138329640527
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 09:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OzNLqxtH;
 spf=pass (domain: arm.com, ip: 40.107.8.75, mailfrom: hugo.lhostis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIkE/XR7fz5EyCa4IjMRHziz0GiZshyOh+VLbfomPh8=;
 b=OzNLqxtHNWYkZ5uDWG3gat5Tg6ZIpNABqkhB1osg8bqLo/mvpgW04cFpdcTiXK7FBYNEThHfEN8x3Va8j2BA8/Va3qUoBjtBUDLZIYTKqskjBWDIjV1JmBS+OW4tB5TV4Vg02cCodQHFZjbnIGB2VZAHTGVYLQL5lQLAlSXU70M=
Received: from AS8PR04CA0121.eurprd04.prod.outlook.com (2603:10a6:20b:127::6)
 by AS8PR08MB7063.eurprd08.prod.outlook.com (2603:10a6:20b:34b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Tue, 27 Jul
 2021 16:42:14 +0000
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::9d) by AS8PR04CA0121.outlook.office365.com
 (2603:10a6:20b:127::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28 via Frontend
 Transport; Tue, 27 Jul 2021 16:42:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Tue, 27 Jul 2021 16:42:13 +0000
Received: ("Tessian outbound 5f693336bfca:v100"); Tue, 27 Jul 2021 16:42:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1ddc723b2fb82ef2
X-CR-MTA-TID: 64aa7808
Received: from c16f2ac360a6.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2B4A16CB-686C-4BBB-9329-AC20DB41FFD4.1;
	Tue, 27 Jul 2021 16:42:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c16f2ac360a6.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 27 Jul 2021 16:42:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ky19nS8zaRZTihc/R/WpNlWNCuHVTRi4sM57D+Kxf7/Eg9cioYn197T3CVpnqH/GxZxjngZE4ljgnsjF5J7CnkY9/yvKx2XZwV8AnQnoZ4dyaKxs0He0NI0ajpFGcdcsS7RElAJECXnGcK0wpONqjB4PIvSR8K/fsCGOx9Kq3vZ+u5DvH0utYwVdEZqDDFKnkz8W8USF7ommjBjFiiPmXm9ZSRh+N9yJKyPRa+pKN+y83jkqkuQ8njlucQyjmgMnn7A1IrayXebQMH6JtyNlgBudTCKmnAaYELKZTZgnAHCu8GFlp6sur8mXSIiibV0ql1u+R3+r0HDIdATtKcqLsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIkE/XR7fz5EyCa4IjMRHziz0GiZshyOh+VLbfomPh8=;
 b=ZC4vmxLkGywm8kMHHZrkkR466w+/WxJ3ZYXciq8209zgrm22TSwt5nbq9tm9pKE1AwCxwpdWzNlh/yC19NqXeynvOJmaI5VhcHPiHY9Xzj5KpxSnlIxM4Jz4WD3+akJRTQjQwJEl1H1NN5D6+EYdpnS5QPEkXTXE6ojRvGlTgFI4BPl4pifW0l1GRhqbxIp+g9yilcvL8di8zEQ2iUhlPYIpyURqqRvnrgMecMy2EbBXtUPjsbEYSP2ZMphnOdZghuHW/3rE93eG/jCgBH7FFkyXICQafFHEPjWK76IKdDWjpqfoB5jBa5qAjRF3EOY3y7fHQOB04GCwak+sfk7g0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIkE/XR7fz5EyCa4IjMRHziz0GiZshyOh+VLbfomPh8=;
 b=OzNLqxtHNWYkZ5uDWG3gat5Tg6ZIpNABqkhB1osg8bqLo/mvpgW04cFpdcTiXK7FBYNEThHfEN8x3Va8j2BA8/Va3qUoBjtBUDLZIYTKqskjBWDIjV1JmBS+OW4tB5TV4Vg02cCodQHFZjbnIGB2VZAHTGVYLQL5lQLAlSXU70M=
Received: from DBAPR08MB5560.eurprd08.prod.outlook.com (2603:10a6:10:1ac::23)
 by DB7PR08MB3180.eurprd08.prod.outlook.com (2603:10a6:5:1e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Tue, 27 Jul
 2021 16:42:04 +0000
Received: from DBAPR08MB5560.eurprd08.prod.outlook.com
 ([fe80::b460:27e8:c976:7a75]) by DBAPR08MB5560.eurprd08.prod.outlook.com
 ([fe80::b460:27e8:c976:7a75%6]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 16:42:04 +0000
From: "Hugo L'Hostis" <hugo.lhostis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Hugo
 L'hostis <Hugo.Lhostis@arm.com>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy/fvp-base: Add support for runfvp for arm-autonomy-host
Thread-Topic: [meta-arm] [PATCH] arm-autonomy/fvp-base: Add support for runfvp
 for arm-autonomy-host
Thread-Index: AQHXf8UdZmfffi2Whk23wIg/g9JFQKtXDM7X
Date: Tue, 27 Jul 2021 16:42:03 +0000
Message-ID: 
 <DBAPR08MB556007A899258A59290CCD8D86E99@DBAPR08MB5560.eurprd08.prod.outlook.com>
References: <16946DEF784D4656.30243@lists.yoctoproject.org>
In-Reply-To: <16946DEF784D4656.30243@lists.yoctoproject.org>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e223985d-ac11-4ac6-5c6f-08d9511d7c94
x-ms-traffictypediagnostic: DB7PR08MB3180:|AS8PR08MB7063:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB70638FD5A14E9B106023654286E99@AS8PR08MB7063.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fcO8nDbd+6cdku5QqXc1fpNsOADcxLopKU4wWI5eQYFe3wJER0LbCMS7BTn9C2PLi37iceCSlcI7sTpyiso+yu8xv5cMVu3e/VqNo+FFVyomyRYzKgcwq2OJeDUFYE24t4wd3iSVjBARUoI/2ieA75uf5Ijt9Yd52suJv+Yn6uxqWY3O+0dvc7MvHZ3DFUHPQd7XSmcEraIMn2MKIfVYvleWmnMeuS/MT3SKjxU27s9CgXcjljvOfvgQIkMd4cA8oi/17OY3ul8gwL45MSZLDymfRTrItqbR3YZD8XOYA6gfoubeIx8aE9eKCbNP9c/MQSJbBXReGevJRfIKNM50+htOGAt4k5LbgXlHLg4+BuRwmHEkFbcPgh2hzzpQ3wN1czOjYX9u8HSPJ+/LOAYIJy17xVneZ0gg5IhmBZomaRkgKFRPcNeTKMnXGTfWvhlV4XFOLAXu61LoDKfRKc9hqdiYz/GsdwHPeI866JPtpNmwBg5b3vByq+YR9qvEMGRyuquuhdLxzbiq1VzSu0O4rIJCRgiNO2UxAahFGavmkU5oAjGUEhjTt6ECL6cMoQyfji7bcdeFITQwdsiEXGZNU6A0kDxeGeXbFt3eId7egwA1BZU+fIKAaTwEsJEX5R1f3w8Qyz3FSvB9AAPWvWLNGSscPLRMziIqgQ9uat7IqPtXc3iozSQXdm/4aNONtw5vbb3XpUS2gNHjsS7CggcLRg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5560.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(39850400004)(346002)(136003)(38100700002)(91956017)(66946007)(76116006)(66446008)(66476007)(7696005)(64756008)(66556008)(83380400001)(4326008)(86362001)(316002)(9686003)(19627405001)(186003)(8936002)(26005)(55016002)(110136005)(6506007)(33656002)(71200400001)(2906002)(122000001)(5660300002)(8676002)(478600001)(52536014)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?UNEVP19yuhzlONrc40nHrPspE4iopHLtVpYh/CIP10SgwztLtF+FWX6PYq?=
 =?iso-8859-1?Q?1RFPUxqiMJTwWS7OSr2p7UfXVh+7oCWY0sdQNUYFP2Ayl8XqVeLbWYXUqE?=
 =?iso-8859-1?Q?eGCJ2shIY5mZj9ThAJPyuoE7RQ3wDUjPRmzhnJfPP6ODLIYiQZgvCIucw9?=
 =?iso-8859-1?Q?J9soi8U0+8DHogbCU20rU3IIlbH4M+I4z6pZzXI4SOxFtIbL89cayHhura?=
 =?iso-8859-1?Q?+Mk49a6Dn1peVI9rI/FmIWFYTr10IDp1SyBRTy34cbnh9MyZN86D0CTImA?=
 =?iso-8859-1?Q?XEBMaZruRmWiGWTknvdRdjQ1dbqfO3y6vguKGkUOCGINjXVpgrT8bYII3o?=
 =?iso-8859-1?Q?TLTpaR4sQqwPoeAR7wLp3/GyecQK7y92MTH2PYiZm9uO1wY3q8dETd2XZz?=
 =?iso-8859-1?Q?CNjJrhHl1bXdMlpIjKoC2qL296n+Pmi1QhbcOsQJFnnlqFmpyd8cYBN1Q3?=
 =?iso-8859-1?Q?BsoOCQF/KXNLztjAX0jmh/caHmOpMK8mJxHKzHirtv/eoeG1lu+qqSpbHo?=
 =?iso-8859-1?Q?0BDV5Nb9WXqYuaPTwuB6HpaOb/VXOGh3zOHjP2g9ghyA3XOOHEJuEuUYj7?=
 =?iso-8859-1?Q?wJ0y8L52L47dmcTtYUlkCEthA28nA582wvUXgr/z/56BD5M3TRpy/EYl6V?=
 =?iso-8859-1?Q?5v+2GcifmSuGk4MQeM4Obj1RT57/DxvxVB4tR+VtTL5G7CRuaniJpC9DaU?=
 =?iso-8859-1?Q?KGGPJgdnl1VdFQB/d7QAe7sp1lZzFWvE9Of/xBLEYhvG81a4U6XouaowJu?=
 =?iso-8859-1?Q?tHxL2cNw7s8pQPO560rdh9gpg9iTSlnpv84XFSl0ylRm6hzs1uqvOcRDpN?=
 =?iso-8859-1?Q?pLNejB0NgEd45B++tDDjwfEpXEhs3XrgN3Kl2+bcjrI6XtKvVv52aExEWa?=
 =?iso-8859-1?Q?p1/KrTsOWgHUD0p1EC0uWhSblUgjkobXNPQFGVsucE4VKamWx6v3PUz2n8?=
 =?iso-8859-1?Q?chSkWkYKfirv9fyUprg3inFY/SSm7K4GKzf99lQ86OWzjDBk69oLDVjPZZ?=
 =?iso-8859-1?Q?WokTFSsO+VgICyZpIpMQEehgjzMSZYWkGXrJhyt8cNL87zATmSqsKoGxth?=
 =?iso-8859-1?Q?n7CXMQF8NgzQfABy6AS+Qoa03CRLUvQKvMysLfLr7gCMoixBPNkilSIUk1?=
 =?iso-8859-1?Q?0L1FpfjsJ0NQ/OAhFmbNxb79LF3D5Tt4CUi8HGOoV13knVcTlLmyjmEPO3?=
 =?iso-8859-1?Q?vuIEhUyfCLaT6jiqHuADfBcqk7tRckgLjCzetcJwV5zP60Es3Hz54hy9Km?=
 =?iso-8859-1?Q?q1AY+FprmYJY5RugUkENdxA1vqSlYDZfO0v7U9CcF7yfkOKZfSAds+nCvl?=
 =?iso-8859-1?Q?yBJxaCnS87J9IncUShS7m1mmiHuRlKWcgSiF6VAu5SNaTsg=3D?=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3180
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Hugo.Lhostis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	39fb71c8-7d6a-4807-d9ab-08d9511d76e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Sd7pMf8Pww8iTj8qnh8gw9kS5vrrOejkile9FyXuI0w5BEGxeYWX1gdmTD7Fs0BK8AaNxpexPikRsbqUskCsbRe/d1bE3eFP11QnZ19SX9oDYZYFodEs05d1eRnyuicT6ldd/khQ77ZUoaAut4b6viHzeY1TUlChzJkZAF0SlSGReyRUv94PZMVUpQlQzf8DQYNM7hJaMz/IYKIuEB/fT0TL4e7lRH2pEPvWoTD9AlhLWS44q6qS/OBjyePqM5Qj4L2LMOt3vr8tO1xBLgOEwT2EowXsNVvy6/kdw4rSjZub6z4UZ+ou/UCGKbKugtvJfm1GMXJXCtNNMIt1weELAF7ADxl9sixUNw6SdlpGfd5EbPJRBsK3cCXHLZjyjAdqa5GRnXlDHnN/QjkAuM4JJAYtnZd22RY/z0CnjY3wEnmTrGL45XE8/qlmUH7BKQegjThYjOVq25EYEDWdHFqwHdAaviw2RUBtn3dFJMh4mL4sXmtpYc7hS01YbW7MXDkghntwaoecqeNQsRBhemdYcWqhb4iWQU/Gr2GLtCEUQ7tLrbzm8pq1BoZjuM0AH1/uima9glkK2RRBfe/DxeHm23uNH5gCi8i+GAui2e46DxKT7ommz58cn1wNFyXVwz9m9tCH6XIfrswfLEE1I0L2M1OS02lR+BmuJ8S1DpYtr2FfQjlRCmwURazDHPvrbqJjwcTfWfgP6Mp5FptJtvN9yQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(376002)(396003)(46966006)(36840700001)(6506007)(9686003)(8676002)(82740400003)(5660300002)(86362001)(186003)(8936002)(316002)(110136005)(336012)(26005)(36860700001)(33656002)(82310400003)(47076005)(81166007)(19627405001)(83380400001)(4326008)(7696005)(55016002)(52536014)(478600001)(70586007)(2906002)(70206006)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 16:42:13.4815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e223985d-ac11-4ac6-5c6f-08d9511d7c94
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7063
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_DBAPR08MB556007A899258A59290CCD8D86E99DBAPR08MB5560eurp_"

--_000_DBAPR08MB556007A899258A59290CCD8D86E99DBAPR08MB5560eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

Could you also backport this patch on hardknott please ?

Thank you,

Hugo
________________________________
De : meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> de l=
a part de Hugo L'Hostis via lists.yoctoproject.org <hugo.lhostis=3Darm.com@=
lists.yoctoproject.org>
Envoy=E9 : vendredi 23 juillet 2021 14:17
=C0 : meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
Cc : nd <nd@arm.com>
Objet : [meta-arm] [PATCH] arm-autonomy/fvp-base: Add support for runfvp fo=
r arm-autonomy-host

Expand the FVP_DATA variable used by the fvpboot.bbclass to load both Xen
and its device tree when building arm-autonomy-host image for fvp-base.

Issue-Id: SCM-2718
Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: Ia6e2f6a13e84c8e762d297ac34ccbe5417a7793b
---
 .../conf/machine/fvp-base-extra-settings.inc     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp=
-base-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/co=
nf/machine/fvp-base-extra-settings.inc
index ee547c2..477d6d2 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-e=
xtra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-e=
xtra-settings.inc
@@ -13,6 +13,14 @@ ARM_AUTONOMY_WKS_FILE ?=3D "arm-autonomy-fvp-base-disk.w=
ks.in"
 WKS_FILE =3D "${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', '',\
                                  '${ARM_AUTONOMY_WKS_FILE}', d)}"

+XEN_FILE ?=3D "xen-fvp-base"
+DTB_FILE ?=3D "${@ get_xen_dtb_filename(d)}"
+XEN_ADDR ?=3D "0x84000000"
+DTB_ADDR ?=3D "0x83000000"
+
+FVP_DATA    +=3D "cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/${XEN_FILE}@${XEN_AD=
DR} \
+                cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/${DTB_FILE}@${DTB_ADDR=
}"
+
 # Set the wks guest partition size and unit. It must be aligned with the s=
um of
 # all XENGUEST_IMAGE_DISK_SIZE set for the guests. By default, LVM2 metada=
ta is
 # 1 MiB per physical volume, hence it needs to be taken into account when
@@ -21,3 +29,11 @@ GUEST_PART_SIZE ?=3D "4097"
 GUEST_PART_SIZE_UNIT ?=3D "M"

 XENGUEST_NETWORK_BRIDGE_MEMBERS ?=3D "eth0"
+
+# This function uses the "KERNEL_DEVICETREE" variable and manipulates it t=
o
+# return the xen kernel device tree file name.
+def get_xen_dtb_filename(d):
+    kernel_dtb_filename =3D d.getVar('KERNEL_DEVICETREE',d)
+    xen_dtb_filename =3D os.path.splitext(os.path.basename(kernel_dtb_file=
name))[0] + '-xen.dtb'
+    return xen_dtb_filename
+
--
2.25.1


--_000_DBAPR08MB556007A899258A59290CCD8D86E99DBAPR08MB5560eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hello,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Could you also backport this patch on hardknott please ? <br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thank you,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hugo<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>De :</b> meta-arm@lists.yoctopr=
oject.org &lt;meta-arm@lists.yoctoproject.org&gt; de la part de Hugo L'Host=
is via lists.yoctoproject.org &lt;hugo.lhostis=3Darm.com@lists.yoctoproject=
.org&gt;<br>
<b>Envoy=E9 :</b> vendredi 23 juillet 2021 14:17<br>
<b>=C0 :</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoprojec=
t.org&gt;<br>
<b>Cc&nbsp;:</b> nd &lt;nd@arm.com&gt;<br>
<b>Objet :</b> [meta-arm] [PATCH] arm-autonomy/fvp-base: Add support for ru=
nfvp for arm-autonomy-host</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Expand the FVP_DATA variable used by the fvpboot.b=
bclass to load both Xen<br>
and its device tree when building arm-autonomy-host image for fvp-base.<br>
<br>
Issue-Id: SCM-2718<br>
Signed-off-by: Hugo L'Hostis &lt;hugo.lhostis@arm.com&gt;<br>
Change-Id: Ia6e2f6a13e84c8e762d297ac34ccbe5417a7793b<br>
---<br>
&nbsp;.../conf/machine/fvp-base-extra-settings.inc&nbsp;&nbsp;&nbsp;&nbsp; =
| 16 ++++++++++++++++<br>
&nbsp;1 file changed, 16 insertions(+)<br>
<br>
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp=
-base-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/co=
nf/machine/fvp-base-extra-settings.inc<br>
index ee547c2..477d6d2 100644<br>
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-e=
xtra-settings.inc<br>
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-e=
xtra-settings.inc<br>
@@ -13,6 +13,14 @@ ARM_AUTONOMY_WKS_FILE ?=3D &quot;arm-autonomy-fvp-base-d=
isk.wks.in&quot;<br>
&nbsp;WKS_FILE =3D &quot;${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1'=
, '',\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '${ARM_AUTONOMY_WKS_FILE}'=
, d)}&quot;<br>
&nbsp;<br>
+XEN_FILE ?=3D &quot;xen-fvp-base&quot;<br>
+DTB_FILE ?=3D &quot;${@ get_xen_dtb_filename(d)}&quot;<br>
+XEN_ADDR ?=3D &quot;0x84000000&quot;<br>
+DTB_ADDR ?=3D &quot;0x83000000&quot;<br>
+<br>
+FVP_DATA&nbsp;&nbsp;&nbsp; +=3D &quot;cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/=
${XEN_FILE}@${XEN_ADDR} \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/${DTB_FILE}@${DTB_ADDR=
}&quot;<br>
+<br>
&nbsp;# Set the wks guest partition size and unit. It must be aligned with =
the sum of<br>
&nbsp;# all XENGUEST_IMAGE_DISK_SIZE set for the guests. By default, LVM2 m=
etadata is<br>
&nbsp;# 1 MiB per physical volume, hence it needs to be taken into account =
when<br>
@@ -21,3 +29,11 @@ GUEST_PART_SIZE ?=3D &quot;4097&quot;<br>
&nbsp;GUEST_PART_SIZE_UNIT ?=3D &quot;M&quot;<br>
&nbsp;<br>
&nbsp;XENGUEST_NETWORK_BRIDGE_MEMBERS ?=3D &quot;eth0&quot;<br>
+<br>
+# This function uses the &quot;KERNEL_DEVICETREE&quot; variable and manipu=
lates it to<br>
+# return the xen kernel device tree file name.<br>
+def get_xen_dtb_filename(d):<br>
+&nbsp;&nbsp;&nbsp; kernel_dtb_filename =3D d.getVar('KERNEL_DEVICETREE',d)=
<br>
+&nbsp;&nbsp;&nbsp; xen_dtb_filename =3D os.path.splitext(os.path.basename(=
kernel_dtb_filename))[0] + '-xen.dtb'<br>
+&nbsp;&nbsp;&nbsp; return xen_dtb_filename<br>
+<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DBAPR08MB556007A899258A59290CCD8D86E99DBAPR08MB5560eurp_--
