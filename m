Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.88])
 by mx.groups.io with SMTP id smtpd.web08.9002.1627379013271397724
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 02:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=toaFTiXo;
 spf=pass (domain: arm.com, ip: 40.107.13.88, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzJutC0PbstgcCgz0Zr+LkHiSYgoHBoHRMQsuaiHTC8=;
 b=toaFTiXo4h3XlOjNnTyt2mCFNVy2sDgy4dTeltiaSxt/Ju+aQZyHHwQjdP1VjgxXeY1XYSTrjczwfnoZMpnOEMcE4YRjNxOg85qpcItr12jW7k1K8reP6zlXM3yNnrV+WFvzFinR6SU0LEJWr/a3tw/AxaCKVurc+kZy7oAxcRA=
Received: from AM6PR05CA0025.eurprd05.prod.outlook.com (2603:10a6:20b:2e::38)
 by AS8PR08MB6789.eurprd08.prod.outlook.com (2603:10a6:20b:38f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Tue, 27 Jul
 2021 09:43:30 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::2c) by AM6PR05CA0025.outlook.office365.com
 (2603:10a6:20b:2e::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Tue, 27 Jul 2021 09:43:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Tue, 27 Jul 2021 09:43:29 +0000
Received: ("Tessian outbound 69e1fde53269:v100"); Tue, 27 Jul 2021 09:43:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 610b360ef42ecf2c
X-CR-MTA-TID: 64aa7808
Received: from 19ac6bced93d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1F519D37-7DDB-48DD-BD4E-1007D97630AA.1;
	Tue, 27 Jul 2021 09:43:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19ac6bced93d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 27 Jul 2021 09:43:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h45sFTegTFEWs7pMqeVMaZkZSqW94VdRvAK35E/BQAslAfhgtrts65nbzDeRRiX8ZDjzGUGzQBeSK1XDgrZt1tg+GX3BehLQKNKHQ1RqllPiVHHiaFGeUJ3TRvMhYwVBUGwhowokdb8bIfxQG+2oQt87G5SqC33vZ40+uXkZ6STZcObN9Yc+CSVNVersvSEi2ygykxjtYOFHeFoi9TlQ2d3jkV24/YFCImDMj6DEBTJl3M+y4dtxR1zvLvhVXiXyFUeBY42AU/+BfW95I0WiOqPvZkR0a8CVzx/weyq36TWl9VYPl1fhH+tuthOPXDsz78RyXVJibIDrG0UXdGjqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzJutC0PbstgcCgz0Zr+LkHiSYgoHBoHRMQsuaiHTC8=;
 b=P86Xo6Vc0ScPN2gMbpPPfyR+7YMYD5YfEirFXwNjjqCrXpxvPAzWPdghlgK5ywWU9PZwVt8SXEn6i96mZCI8QlrCrAy0jc//YB0fNGCIvBdvHXoHjPC+Hj3SKG8v4IzOYjTj00azFOKxOMbF06IkO2cLsWcBmh/MO76mtONUv3SAL9zbCrbxX1n43BsCNmguElQ0pJL1mjTqOOPvODw4nKCjVaj9c6hloemN+lJJhxbw/A/5MRo7UnUiTJScE5PwW27m9QzijfcyVSeFw34TJXgIuW6U3Nbrzj/7qmFsmxNrbsUYdfXf3Hmp1EbilBRPaWfN9ihFnK+yqrzY8htxyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzJutC0PbstgcCgz0Zr+LkHiSYgoHBoHRMQsuaiHTC8=;
 b=toaFTiXo4h3XlOjNnTyt2mCFNVy2sDgy4dTeltiaSxt/Ju+aQZyHHwQjdP1VjgxXeY1XYSTrjczwfnoZMpnOEMcE4YRjNxOg85qpcItr12jW7k1K8reP6zlXM3yNnrV+WFvzFinR6SU0LEJWr/a3tw/AxaCKVurc+kZy7oAxcRA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com (2603:10a6:102:136::18)
 by PAXPR08MB6767.eurprd08.prod.outlook.com (2603:10a6:102:133::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Tue, 27 Jul
 2021 09:43:21 +0000
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::b4c4:746b:9a5e:2a34]) by PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::b4c4:746b:9a5e:2a34%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 09:43:21 +0000
From: "Arunachalam Ganapathy" <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 1/2] arm-bsp/trusted-firmware-a: update SHA for tc0
Date: Tue, 27 Jul 2021 10:43:05 +0100
Message-ID: <20210727094306.3297231-1-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
X-ClientProxiedBy: LO4P123CA0115.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::12) To PAXPR08MB6766.eurprd08.prod.outlook.com
 (2603:10a6:102:136::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.51) by LO4P123CA0115.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:192::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Tue, 27 Jul 2021 09:43:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a2df93c-9d25-4c79-7487-08d950e2fd9f
X-MS-TrafficTypeDiagnostic: PAXPR08MB6767:|AS8PR08MB6789:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB6789BCCAD049781FC7B66613FBE99@AS8PR08MB6789.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 1f7N7Y2fNt9Qt/0oUll+NzgsBNSBDg8Alp1N+9vUnRpoPE0uPBROCfiiZq7B+3ixR4d74ILfs01SGRVulgPXxBhbi7fYPLU3ifXmo/HEYgYLp0HDLf4EDjdmMcRvADK7uWcz5XPVFbYldgNqb1TgLI5SwE85bFF8sNX2J2WwoL7O+z5wrgBdtfatyc+9zvCpgOgf4cusyma/EI/5rpOFCmdtpToTzztaUpesFcNPwEF7qXXN6E6x0/7h215WV6gNVSPnNcZm8I5HML8EMyTiDhgJ8cZtOji5729KF5S0Ex5kkqeszlB//qeUYXMOBTCayKDjlwvn8iXAWjOCIvDa5JvRi77HvEtarPqnWcRfrw55klRtxyun0v5eX2W9RtB8Qc2ndajWe/Zf2RCuUcOAw4EjV4C2z897dUgwmaW8i8o2VDkGyG6HnJTwvRi2pfcHfxjV8DdFPLox2m9vSvR1FO3Xv8dEFNCzlRLDGJZl1zUQ36nsncmxncop+AKaFf727d3951AY+KI3NZ/uvmCTqOb3opwRtaledMGHtZt2UkQ9xAgvjffYeFm/Ec2xrKum4iRKnEnB3Yoh7DcaNcm5yfi5gB8MP+P40P8pKER03gWV3w2guuWXbDus9KVkX+xdLn1R/X3V+erKGMvsbj7g6y6eceym6SN/5LNbrBM5yzFpX0hPDAcp6HjlfbN18f4Dlx+sPJlUP8Uqlj8ox3rrWg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6766.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(396003)(39850400004)(376002)(66476007)(66556008)(7696005)(5660300002)(2616005)(8676002)(52116002)(478600001)(36756003)(2906002)(6666004)(44832011)(66946007)(316002)(38350700002)(4326008)(38100700002)(1076003)(186003)(6916009)(26005)(8936002)(4744005)(86362001)(6486002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qUuIoM90TXq97aVbXusbIUzVC5W/NKjtMmekFLOuqNJl1bwoUaGJ0qB2y8I8?=
 =?us-ascii?Q?9eqqD+49wuP9KlTJAH2NlfQY2Auh1mZYxmkcv1qjn+B5kooXk5VlgafUXFOT?=
 =?us-ascii?Q?BNVYjpBuC5atAoDlnOVk8UbROXKnxy1P8NnT2qc3UQ78zaycjFYXJXPFyCIR?=
 =?us-ascii?Q?jzNmN/MpcQyCM72VBrL7gLwfQIKlbnmxuZuGQC9iZVfXsEzTb8iqRiHr2jcg?=
 =?us-ascii?Q?qJTD4NJnasw5TBtbLMq3FunwHWdRVFrTrA9TW77BLZN2a7WTWOIyHomYFYDm?=
 =?us-ascii?Q?5bHDBymyW4jL2nAinNgv1WCG4UAgiMaeqTJlVcgznLS6bzfqJIkdLpx+Bvky?=
 =?us-ascii?Q?rsZCtnxHRMafEw6Zq1vh6vTjN+dbL2y0eJhQuATSN+XyWwFXtnoAqzDZueo9?=
 =?us-ascii?Q?7WRzJ8DWykfMkMnIyueIvCYmEI9uHvYfjPjGvamTc31RAlBkaZuyC20E/qUr?=
 =?us-ascii?Q?G9U+Ltvq5QLbJKgsFb0UPijUlIWKeGKL/L/EFZ2zW6erRC7fxVTUN+zT6cQ7?=
 =?us-ascii?Q?j8jQy0Y+wVumbMFNfGj8LiL/SjxyGUDpC2RQ6IVfTsMLIXHUIso/88U0m9ir?=
 =?us-ascii?Q?y6Zqc7Op2bcTB0pQWQ//su2kSOKUQhywKY2OP16sT9RKk+syL3H42aaH+fLW?=
 =?us-ascii?Q?YJ4aQhjBCQH7uMeISv+9+yqbKqic+E5GmkHYR+xoPZ1v4sb7N01Dcy3IyQqz?=
 =?us-ascii?Q?8HbJTKARIgKvJ4rld972rew0Gglh1eE5z5PsnBFyPYob12zh3y9GXVFjezTu?=
 =?us-ascii?Q?oNqr6tV5NbN6kGvavpBGqynHHE+qf0m3UPWOA1eTPWMSHmD1cv5UnM+cnHcb?=
 =?us-ascii?Q?Wmsjst7h4SgyfXW7IJUnUhydlGLEMQ5/ZY5tw4Wo3X2hybeBe3pifwGinmjz?=
 =?us-ascii?Q?2diQ8/63Effd84/iv1RTokFsshKCn5YlBjASRLuuqNkkSZUrS1rgcTPgA3Et?=
 =?us-ascii?Q?bblhGpdLf0ZxFS9WRPZTYXP6inxpKDiTIVVT3wcWVcn1ddyQhblO3qpikeE4?=
 =?us-ascii?Q?vsf3qRyavcSP7KXUln7Q9ahnHVXvdXICDSj0W8cvvg1wGVWAudXgU0gYJvKB?=
 =?us-ascii?Q?+aBup4l9xFAxJ27laEkAFBVq5OYEgB198moKi9cIkAXpvmpTOgqp+KmJMdc8?=
 =?us-ascii?Q?SIk/tzStQhCeFrY8K7rx14CapMWH+Q+zGaAV6Cw43YusJL5Qq64ocVLwCVTy?=
 =?us-ascii?Q?qMIDGluWmvwgisw1W/3n8Y948YSvK3WVRKeRQ5Ju924/Ys5xU+rBqaYh09i8?=
 =?us-ascii?Q?ZnTccDX8jvnL27WlSPNqqFxK+p/yDayRpfWTxDGfDK9eqJqq1He/1enFME0A?=
 =?us-ascii?Q?UaZY/99nDQk/7B/sxAzsov6k?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6767
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	558e83e2-a52e-4dbb-202e-08d950e2f89c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FtPPRK3pAYew2AFb+UoU3rMNdVmUfijr1odfU+05Dt+YOlL//CHneCAXm8Fv4Dt9BGODJ1D4vl3qhd2nTzkfjj20pG4Z0aZ0XSAQkWu3RcuPqFpardzOYWlc6vs5+F492tjnWwCCGyATfZbg+RZqRle8RsASfknoHpCz+GuonOm85Loz1JTETAuxDOyc1MfS2xzGmZJYhqU0QoFL5u35zcSXRmWULeKKIcYHqZs0ypDs8YslDsRijpxCvVJNElxlsOuRkYyThWBSQCxF1qFC76Ows/EPGE5+qSVbGO3ZysA26sxAdRA5WOf2qrwNsy6erxy+3QSDYhrIwSUF352HbGcE9dopek1WDIU5tZC8HKY6AIvzf74I6SJlXa181Y/Mx9EelaGPipmHSs+ZRsREorTPjafulLvhD3ChneQKZFRdOyVnbqVBlrcWcZ3Jzk0CVOcfQm7hc+s7fg0V9Bu8k7lYHOBDMUcVXpeuqkIwgAg3Vq3mMV3+uDRsBfNR35y9UwGDh8DJRN0mD95cohCQPjMlJ2yVoJb4W3ijbi3Z+2ZmaMRbIjIVVR0LGaK3tufZqr8Jfneokc010l0QIggJveKxg0oPedLuBELFeU6fk+RGkUzNd5RFKlpezXHBPRDgqW6xiJrp3kkSDvztrrqp3BEEnLmoaGQ8A8wNWhtdqws8rOUEf26Ga8EU2ZYqg6QkapIzGK1n+ocPgm1Fotcsxw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(46966006)(36840700001)(86362001)(478600001)(82310400003)(8676002)(356005)(956004)(70206006)(70586007)(36860700001)(4326008)(26005)(2906002)(2616005)(7696005)(47076005)(36756003)(316002)(6916009)(186003)(6666004)(44832011)(336012)(8936002)(6486002)(5660300002)(1076003)(81166007)(82740400003)(4744005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 09:43:29.6948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2df93c-9d25-4c79-7487-08d950e2fd9f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6789
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This SHA contains fix for SVE and AMU extension

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: Iefa3e8f9bee41098ea49304d88dc04df74ddcb9c
---
 .../trusted-firmware-a/trusted-firmware-a-tc0.inc            | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
-tc0.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-t=
c0.inc
index 53ff110..93a9b4d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.in=
c
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.in=
c
@@ -1,5 +1,10 @@
 # TC0 specific TFA configuration
=20
+# Intermediate SHA with 2.5 baseline version
+SRCREV_tfa =3D "a52c52477aa797e6a261215e9b3536533590b334"
+PV =3D "2.5+git${SRCPV}"
+LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Db2c740efedc159745b9b31=
f88ff03dde"
+
 DEPENDS +=3D "scp-firmware"
=20
 COMPATIBLE_MACHINE =3D "tc0"
--=20
2.29.2

