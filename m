Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63834C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 07:34:27 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.44])
 by mx.groups.io with SMTP id smtpd.web10.2521.1682494464913634205
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Apr 2023 00:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ipMcnB+i;
 spf=pass (domain: arm.com, ip: 40.107.8.44, mailfrom: adam.johnston@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uLG0S16o897Lr+HRHwdvSFdgDpSWOGFsX7AIL/4tSs=;
 b=ipMcnB+iHmwl84Y03tRPzKxu9G9cLf7ynooz32wamiZlVeAxPcQPF5hWw/B/SBKmr5PFWKnXaKGPlT2wUHE9jlUlCw0uhgB5XebupqEqrWjXW/76rC6N82rz/cXvng0VhHyLyMab8cdtURCEwKCCcZe8Mv8LOQVNjoidsksTamE=
Received: from DB8PR06CA0051.eurprd06.prod.outlook.com (2603:10a6:10:120::25)
 by AM0PR08MB5427.eurprd08.prod.outlook.com (2603:10a6:208:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 07:34:18 +0000
Received: from DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::44) by DB8PR06CA0051.outlook.office365.com
 (2603:10a6:10:120::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21 via Frontend
 Transport; Wed, 26 Apr 2023 07:34:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT038.mail.protection.outlook.com (100.127.143.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.20 via Frontend Transport; Wed, 26 Apr 2023 07:34:17 +0000
Received: ("Tessian outbound 945aec65ec65:v136"); Wed, 26 Apr 2023 07:34:17 +0000
X-CR-MTA-TID: 64aa7808
Received: from facd71e855fc.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 74187D62-8138-4126-A3B1-8D51DCD81B62.1;
	Wed, 26 Apr 2023 07:34:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id facd71e855fc.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 26 Apr 2023 07:34:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXbyFhZUNR+vIeH0jDPD0FPFg2oO2vRxca09irCe2sRysB9iqAtMFCW+4t64+YwDMGpRbQh62aHUnPIjjjhHIPbLt4DMLn/dS8R0dRSlrQf4Ld2pmdA1FW7GEM9avbauJwoFL24cXionE2+BZofGuQC9ej4SZJucVyxODlcfLJ3TXygBCC0vNZg+/bTAP2wiTS+15HqMPEGWn+6JwZJlyr6feoOvXvBPdS4GIEL+gKLNj9T0j1gWPlDUHvupLTUVocw2J5rMoPgH7FiTIOwMuCa5s6nNUelp+ffLG2VbA3J6ujjwQsPk1+TE7p9YI7c3897q9WtnmJLaogGOZ1Hn2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uLG0S16o897Lr+HRHwdvSFdgDpSWOGFsX7AIL/4tSs=;
 b=Gva9B35AS9TcZaWE7hMdGgGIowUcd8IcywSLMw8fT/1JQn9LMlJuXzgzTRLlL2JdBzWTuMkSdUVdiidHMKmwKFOgz1r7ahi9DRZZmBTfyHmtDbBRwiko+9scVVfpeKK7uHlrDPiDXYOzCgXxjKGCops+CbtN1Fg9CvBeOca4XfFuklyD75jo8SwGOfCWR0tVKBMKjptxfbsILtaDz3aB5N+ctxP4jAQZxRA+IinMYp8xMwpRQFi96SAAbTcnEeTEIdCaQx0CYGeWzsIi7i5aKLCgjh1i0FkuOHsZZpvgpDfaGZ6TI2oINpnm+wiGoz/gvgs/bUGpCBppqxxdIKoSNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uLG0S16o897Lr+HRHwdvSFdgDpSWOGFsX7AIL/4tSs=;
 b=ipMcnB+iHmwl84Y03tRPzKxu9G9cLf7ynooz32wamiZlVeAxPcQPF5hWw/B/SBKmr5PFWKnXaKGPlT2wUHE9jlUlCw0uhgB5XebupqEqrWjXW/76rC6N82rz/cXvng0VhHyLyMab8cdtURCEwKCCcZe8Mv8LOQVNjoidsksTamE=
Received: from PAXPR08MB6432.eurprd08.prod.outlook.com (2603:10a6:102:154::12)
 by AS8PR08MB6615.eurprd08.prod.outlook.com (2603:10a6:20b:335::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 07:34:06 +0000
Received: from PAXPR08MB6432.eurprd08.prod.outlook.com
 ([fe80::a403:711d:c4d:bc47]) by PAXPR08MB6432.eurprd08.prod.outlook.com
 ([fe80::a403:711d:c4d:bc47%4]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 07:34:06 +0000
From: Adam Johnston <Adam.Johnston@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Ross
 Burton <Ross.Burton@arm.com>
CC: nd <nd@arm.com>, Adam Johnston <Adam.Johnston@arm.com>
Subject: RE: [meta-arm] [PATCH 1/1] CI: Remove ts-smm-gateway from N1SDP
Thread-Topic: [meta-arm] [PATCH 1/1] CI: Remove ts-smm-gateway from N1SDP
Thread-Index: AQHZdh5ArXdAGyPDykeDCPhBOxd23a89NhpQ
Date: Wed, 26 Apr 2023 07:34:06 +0000
Message-ID: 
 <PAXPR08MB643229CEAD182D64D77C4106E9659@PAXPR08MB6432.eurprd08.prod.outlook.com>
References: <20230423195855.1800774-1-adam.johnston@arm.com>
 <1758A8B2CA2BFA80.10313@lists.yoctoproject.org>
In-Reply-To: <1758A8B2CA2BFA80.10313@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 9EACD28F7FAD3544A49AD59791393A39.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PAXPR08MB6432:EE_|AS8PR08MB6615:EE_|DBAEUR03FT038:EE_|AM0PR08MB5427:EE_
X-MS-Office365-Filtering-Correlation-Id: 5083bcb5-6f4b-4a56-9228-08db4628a4a4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 epVb1AGGz8nSlQ8Z8Q98j/z7mDDNiTOQmR63Gpgy6ILKiAykAEzrx8uJNiaq+XdFsPQr8xWBukA4UWcw7m5wtDHiiubqBsY0DqmfAe8CZEvRZQFuQnl+sgopZXr9avbutShGccZTLH6aJa7K4plSF2i1fAAqmasPYFSsbCGp7o18ZhMRNAv6wDH66znywhPBG8Yqr+jd01exhcF+A2vrK+u1AtvRfA+oleHNXCcuOTccrF0OvsdCdA58MDTukDhAUBviN8LgBTvaK4xC48hJtY51R4Spf+hri77gNRweyckO0Q2Q0sTFDRu5NtH+TSNxHKCGVo/1LdkoJ4HXrr5m7lrDPPadnzPghlRxtD4as/4OnFla/O1RF6hu/FD0kxJ4QY00gEdpCmrgQKZiTEwszzeEHLpW9xVnVBVVrVkil5Mk4lDd/5t4fmZWp+j5k3Dfm16zBZOEEWxq1QDk8s37zIhWckdhHUJHIf0qEkyk3Or6Mb/2LZW51o8N9JdW27zD46jK6Hdmj7cllq2gjoTt9/ewnfc48QVj6EfeYPlr1yg7Si0Xcu0/v+Mh9c86lt2iANKypuYlT9+Nkxbvic2G9bj993JfN/9pMgwZ/qhFfBeMgqFKTqiSVkSUfx6KL+J0Y5jDpyCNjEeuv/jfZctFFzSu3lEJqfg2A9qWiLShoHPcBrAQ2ngV0b2JthkHMJ2xGfqDmCP0b4x/KHqFstqyCw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6432.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199021)(66946007)(66556008)(66476007)(64756008)(76116006)(66446008)(316002)(4326008)(6636002)(110136005)(54906003)(55016003)(5660300002)(52536014)(41300700001)(38070700005)(8936002)(8676002)(4744005)(2906002)(122000001)(38100700002)(186003)(53546011)(9686003)(6506007)(26005)(83380400001)(33656002)(86362001)(478600001)(71200400001)(7696005)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6615
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0db88b76-b090-46b7-ac4b-08db46289e00
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nh0JQ0NUymHb0UcjsTdauimLNXuBtkcZ7S4RBAFqRF2RUDAKr1//IQYnitF8/paXj3pDYeafKjkeRuBVSEwNPJmnYZhEScaREJowbBAo+lNj14ubnLjEilZ6G9I+oUvMwwyMpKXVvU9Bd6Un2YzpcEKA7BADf4n1cfhH4SD7/YeII77EvnCfBFEvVTXg1Bqssoql3DO88SH7beE/0wYc3Zy4WK3nVFqQHxsEByeLXaiqXwPXSAv2jw5dzaihG5LCwRPgzmBu0XDdO+OdEmVVLVjOLobxqg9jEht31nBzI5T7bC3MP7qmWFsndkhlGF0gyTjBABGrOT8QYNmgI/zTooERGkH7oPQe69juEMZYNs2AEwaY/K4oThxj96F9smwXt2e3Vv3Z/EojFmXCn91mRFsUUi/7WZJPx+/sp1Z2kNh1xgGUZd7EWVL8CKBhHpSg75FOiG5pueqVtXn9uKL7GTiTm1kPY2GmTE16+mX5b/XLVEs/q3MFXt8LTewYXVjjPSu2/+fP/D4xxwSbW7pb9sNdpAFd13kbh0Se9tjHqylqO1abIBE3CC1n0rzHzUsHE6ZQ4RkMKy5uR3FoQi/z2Qm/mDNN+CQxd9FeTC6+dvW0EuDZV2MBZe9/Ea+8sPcEpMC4buq/QfIVh42GixDQfzLlAxV+9oT/NlANlc9he5wxWBnWPjWwqMyCO4xwE+TC4XXJ3xwntcU6vE3HhrJFXYu7eJNfZsbzLHkD9yLyMW1OFBGoCzXq+KTsV3dwMAn0tA2b8YczgxQBhFEl0L2UOJIJduPjhmoq/rfTuiN0eW+Sd7Sc42R6FeqpMiTa74zg
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199021)(40470700004)(36840700001)(46966006)(53546011)(9686003)(26005)(6506007)(186003)(336012)(40480700001)(110136005)(82310400005)(83380400001)(36860700001)(7696005)(4326008)(40460700003)(47076005)(82740400003)(55016003)(316002)(41300700001)(356005)(54906003)(5660300002)(34070700002)(52536014)(33656002)(478600001)(2906002)(86362001)(8936002)(8676002)(6636002)(81166007)(70206006)(70586007)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 07:34:17.7942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5083bcb5-6f4b-4a56-9228-08db4628a4a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5427
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Apr 2023 07:34:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4619

Please can this CI fix be backported to langdale?

Thanks

Adam

-----Original Message-----
From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> On =
Behalf Of Adam Johnston via lists.yoctoproject.org
Sent: Sunday, April 23, 2023 8:59 PM
To: meta-arm@lists.yoctoproject.org; Ross Burton <Ross.Burton@arm.com>
Cc: nd <nd@arm.com>; Adam Johnston <Adam.Johnston@arm.com>
Subject: [meta-arm] [PATCH 1/1] CI: Remove ts-smm-gateway from N1SDP

From: Adam Johnston <adam.johnston@arm.com>

Installing SMM Gateway SP on the N1SDP may stop the platform from booting f=
or on-device testing in CI.

In n1sdp.yml, remove `ts-smm-gateway` if it has been added

Keep `ts-smm-gateway` in default SP set so it can still be tested with `qem=
u-secureboot`

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 ci/n1sdp.yml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ci/n1sdp.yml b/ci/n1sdp.yml index 797a5225..f6883079 100644
--- a/ci/n1sdp.yml
+++ b/ci/n1sdp.yml
@@ -4,3 +4,7 @@ header:
     - ci/base.yml
=20
 machine: n1sdp
+
+local_conf_header:
+  unsupported_trusted_services: |
+    MACHINE_FEATURES:remove =3D "ts-smm-gateway"
--
2.25.1


