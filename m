Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.57])
 by mx.groups.io with SMTP id smtpd.web10.21532.1593609621226212077
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 06:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=eIa84kOe;
 spf=pass (domain: arm.com, ip: 40.107.20.57, mailfrom: gabor.abonyi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mUZWI+7XyfyrAJ9/L3w+ZyUErLR9LWwFrCeCrCDLVg=;
 b=eIa84kOeJP70sQkuAWQ1ExD81oDGR4Re4FIZ0MFT85LsbqJqAqT2HVfWK35secNqt+l/sl+40WuE5XfyEHpmGkZlWGLcUIzQHuOa9wURqFFBdhvQ588gaUr4S1T7qRMsJiZXX9O5TeuwQZUpuOWS8+m/ThthLpUWWrjMYcmOt3k=
Received: from AM6PR04CA0061.eurprd04.prod.outlook.com (2603:10a6:20b:f0::38)
 by AM0PR08MB3748.eurprd08.prod.outlook.com (2603:10a6:208:fb::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Wed, 1 Jul
 2020 13:20:18 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::ce) by AM6PR04CA0061.outlook.office365.com
 (2603:10a6:20b:f0::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend
 Transport; Wed, 1 Jul 2020 13:20:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Wed, 1 Jul 2020 13:20:18 +0000
Received: ("Tessian outbound f7489b7e84a7:v62"); Wed, 01 Jul 2020 13:20:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c6b93531b9e408bb
X-CR-MTA-TID: 64aa7808
Received: from ba3983d6db67.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B1E4D989-D249-4A9D-AA02-2A82153CAA51.1;
	Wed, 01 Jul 2020 13:20:11 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba3983d6db67.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 01 Jul 2020 13:20:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yda5CkBAiU5M6m1bgZfTnPmk4IUG3G1u3IekCEiHJGnB2JCXkkPrrsETZVxZ7Cx1iTK6166qEgp7UYiTwPJ5dBGH0bN6hrSwD2wnnSafCHi6UCTAZLqOV1tIXTG0knUZhC0a0lok074hGRKnWSadAcBe33QYtkjGbbCzQnIaMVJuaWOrKCnSNtrusitGEDh6HAl6jWKlshU5mssMBwJbTRbYK3pRQZkmhTyvkVqoNmjXbTcxjfRipQIPOHaYqRbkdsjTSP7a70rs3+z6NywPvsu1ElFZSTny4KzWgT6aj1a+UbubNEiTP49E+Knvc6ZP8pGrWLHISsDHsODefFCblA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mUZWI+7XyfyrAJ9/L3w+ZyUErLR9LWwFrCeCrCDLVg=;
 b=FCXiJ02OvjYNLd6y+xgzZoTQWXDiabddsjsa8vl8Jh4uu6Guid47vor5uhC586w1KyTMzvTKMxJWQiDwuI9Jc7gvFH2n2ZPlqoumHFf15ZM86k8nEtIMRDtKdifx4doW4B2stnb69kx5a+2GmSDoAkjLRqnHaaKLpBrjn9HqwPvZSKnHdnBjZiZNNezYa91Z87JZsDfPaSPj1YX9rwtRGLXUXW2PcU7fZM7dS0gcsZtryACAMaD8+KJ1GKAhnNrYGMiXCGVGumCZDiQKR5RZhZMm0H84YD7P90P8LVQ+u4SBOmFWeevkBkIzR4x0EtQ186WE0An1lBTbN1PEqKjQ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mUZWI+7XyfyrAJ9/L3w+ZyUErLR9LWwFrCeCrCDLVg=;
 b=eIa84kOeJP70sQkuAWQ1ExD81oDGR4Re4FIZ0MFT85LsbqJqAqT2HVfWK35secNqt+l/sl+40WuE5XfyEHpmGkZlWGLcUIzQHuOa9wURqFFBdhvQ588gaUr4S1T7qRMsJiZXX9O5TeuwQZUpuOWS8+m/ThthLpUWWrjMYcmOt3k=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22) by VI1PR08MB3838.eurprd08.prod.outlook.com
 (2603:10a6:803:b8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Wed, 1 Jul
 2020 13:20:10 +0000
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::4d1f:13c7:837c:2b74]) by VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::4d1f:13c7:837c:2b74%6]) with mapi id 15.20.3153.022; Wed, 1 Jul 2020
 13:20:10 +0000
From: "Gabor Abonyi" <gabor.abonyi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Gabor Abonyi <gabor.abonyi@arm.com>
Subject: [PATCH v2 5/6] arm-bsp: musca_b1: Add machine
Date: Wed,  1 Jul 2020 15:19:39 +0200
Message-Id: <20200701131940.3084-6-gabor.abonyi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701131940.3084-1-gabor.abonyi@arm.com>
References: <20200701131940.3084-1-gabor.abonyi@arm.com>
X-ClientProxiedBy: LO2P265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::31) To VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gabor-VirtualBox.arm.com (178.48.104.185) by LO2P265CA0019.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:62::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Wed, 1 Jul 2020 13:20:08 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [178.48.104.185]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1310664a-585b-48c1-fe54-08d81dc17fd2
X-MS-TrafficTypeDiagnostic: VI1PR08MB3838:|AM0PR08MB3748:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB37486BA50DA3238E5733DB358E6C0@AM0PR08MB3748.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;OLM:3044;
X-Forefront-PRVS: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 n1bQD9GCSgGiUdCCuGrEudcsM7es/2k9f4Jj3tpvmJ8gS9pJsn5dfdsZu5x2RNkLhz5YGr4wSHUxzrRZnNpDhpb6fVFNle35kAVnrQNM9WeunMFEmJmShYahy4LXvH/z+wwPoDE2eNFJ1EvzzaEHjxeWyGeujsrMWHZ7OZY1ETAWXZ4PSjYJp5GKvbBRFfuQNfoeVUyyvlEDyusBCqQiNqLbJHNrcigxyAoPz3R78+GgynuDow7JWtspaZ/99c+OrvfrrVsbt0PovmJFtwgJm3OFZhvcbIFI34jlCrz0miX4EmMZn8AdvhBhcXRK9OHW1gzOm72t5TWldEHGPk1peg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0802MB2414.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(956004)(66476007)(8676002)(66946007)(2616005)(478600001)(2906002)(186003)(6486002)(4326008)(8936002)(16526019)(6666004)(1076003)(26005)(6916009)(36756003)(44832011)(316002)(86362001)(66556008)(52116002)(5660300002)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 d7I7uxRJB8zELgw01TUPMTgPZ9cUfFc2hdSvmJb3TyAq+SJ1cz6r8412tX9/dYOB9nkeDnURllfu0z096Jyqv+UrFIuFXLoHOOBVhFhdrTcHr8co7ujhgiQz3Uu6rdcR85yQ7ViZBMI8FTs/4ZuRzjxVa7jtIco4bx20BkzHYSSzthJF+qasVF3u1KZdQg18nCBGeYbNn9um35+GAfVHWQem4T+4fLNI9sw8IeJwDFcHE84kSJnDH/cllRBqxRGAO+vK/aNirTVRiVQp5hZeB0Y4/e+qe00dJL0VBcNOm28o+qQX2YdmM765x6GVmuqrMUjeYYeM+Wn1D8WsrZ0wiPmbWk6ksRUIlwVlpgkEEcNL9Qr6Wm/jKm1muUCSffeoWLeW9vXOqgEzqsekQEet2bmjV8nLIKjVCcgh2WZjX4BCC8L40WltcYy/rew2IVHQox1xJ7o4eWDkVub4RKPTJBrHyMsjoVruaoP+L56T1bs3xSBtOhlWSSDLjvZ3as7k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3838
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Gabor.Abonyi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(81166007)(70586007)(70206006)(44832011)(36756003)(47076004)(2906002)(82740400003)(36906005)(1076003)(478600001)(316002)(336012)(86362001)(8936002)(6916009)(8676002)(186003)(82310400002)(956004)(2616005)(26005)(16526019)(6486002)(356005)(7696005)(5660300002)(4326008)(6666004);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0f6b1362-bf6e-434f-a29d-08d81dc17aa6
X-Forefront-PRVS: 04519BA941
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YAknX/SAspvnKNmdWfrYlSXKG+RL9sOXF5+B3jTyZMvVNnqO9I506ZL/NCbLBXOPOiAmR5AsVglcohcYTftNqF4+ONTkVHmCCy+nAAUZ6Up7LYuy4O5WkyfOQ0cmNFszYbM9YmQRZ1sHW0ibrEczLHz+d+Boh5gumG/14wJ9ZEY38ID+2xSX/FgdOrBuDPOJnGfCN7COfDX/veGUvnkxOJfj795by05lY4VAQ4voidrUzEBs8UlhlLqpT7j0n2CHA1tJLi0pGsyl00RtdH6PuiQdLn3AiGv0iP3uRS9BzWiKjttJr38zaPL84FhshiKREgoA3dryZGTA9ZzQC7+VWT+ZAj686M3MkgdGxK1daZt9zS95L2vAXDrPQWAH3Bo5pW3MNeEwuURHvhVgwciUsw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 13:20:18.2693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1310664a-585b-48c1-fe54-08d81dc17fd2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3748
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Add Musca B1 machine. Also add it to the supported targets
for Trusted Firmware M.

Change-Id: I66dcc87df9a8dcb258de701ffbdcde264b0886c5
Signed-off-by: Gabor Abonyi <gabor.abonyi@arm.com>
---
 meta-arm-bsp/conf/machine/armv8m.inc                  | 10 ++++++++++
 meta-arm-bsp/conf/machine/musca_b1.conf               | 11 +++++++++++
 .../trusted-firmware-m/trusted-firmware-m_%.bbappend  |  2 ++
 3 files changed, 23 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/armv8m.inc
 create mode 100644 meta-arm-bsp/conf/machine/musca_b1.conf
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-fir=
mware-m_%.bbappend

diff --git a/meta-arm-bsp/conf/machine/armv8m.inc b/meta-arm-bsp/conf/machi=
ne/armv8m.inc
new file mode 100644
index 0000000..e7c7ca8
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/armv8m.inc
@@ -0,0 +1,10 @@
+DEFAULTTUNE ?=3D "armv8m"
+
+TUNEVALID[armv8m] =3D "Enable instructions for ARMv8-m"
+AVAILTUNES +=3D "armv8m"
+
+ARMPKGARCH_tune-armv8m ?=3D "armv8m"
+TUNE_FEATURES_tune-armv8m =3D "armv8m"
+PACKAGE_EXTRA_ARCHS_tune-armv8m =3D "armv8m"
+
+require conf/machine/include/arm/arch-arm.inc
diff --git a/meta-arm-bsp/conf/machine/musca_b1.conf b/meta-arm-bsp/conf/ma=
chine/musca_b1.conf
new file mode 100644
index 0000000..0f9734b
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/musca_b1.conf
@@ -0,0 +1,11 @@
+# Configuration for Musca-B1 development board
+
+#@TYPE: Machine
+#@NAME: Musca-B1 machine
+#@DESCRIPTION: Machine configuration for Musca-B1
+
+EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-m"
+
+PREFERRED_VERSION_trusted-firmware-m =3D "1.0"
+
+require armv8m.inc
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
_%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-=
m_%.bbappend
new file mode 100644
index 0000000..f86e2b1
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbap=
pend
@@ -0,0 +1,2 @@
+COMPATIBLE_MACHINE =3D "musca_b1"
+TFM_PLATFORM_musca_b1 =3D "MUSCA_B1"
--=20
2.17.1

