Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.56])
 by mx.groups.io with SMTP id smtpd.web11.2586.1596536982660043380
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Aug 2020 03:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=AYZiqG8j;
 spf=pass (domain: arm.com, ip: 40.107.21.56, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWCIJNILym+xOGWKnlzTm2ieOhMKTMaZl+zGVSdBLns=;
 b=AYZiqG8jIRv36OmgX0X3qXzei4zGQi6PGn3y01Ne0vwuNGUH8dpKOcJadxAiQGWHhI66AXx2EvbW/mB6jBKt9bdUNbAhcsYReUrUA90zej5Vke/zoAZ/meUHSAw+XCaMiDIC5+94ZKISQk7+zZIGZqLsm8KBi1Ci2ezuM8aExOE=
Received: from DB8PR06CA0003.eurprd06.prod.outlook.com (2603:10a6:10:100::16)
 by DB6PR08MB2760.eurprd08.prod.outlook.com (2603:10a6:6:24::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Tue, 4 Aug
 2020 10:29:40 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::e1) by DB8PR06CA0003.outlook.office365.com
 (2603:10a6:10:100::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Tue, 4 Aug 2020 10:29:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Tue, 4 Aug 2020 10:29:40 +0000
Received: ("Tessian outbound d778af23b2f9:v63"); Tue, 04 Aug 2020 10:29:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5cfda8a4582121ad
X-CR-MTA-TID: 64aa7808
Received: from efc7d58b852f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 93CD00C3-B12F-4338-9183-4FE0A1F72A98.1;
	Tue, 04 Aug 2020 10:29:34 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id efc7d58b852f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 04 Aug 2020 10:29:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXqrp/l1IJFHriO9GGTT3PPnXcK4n7nm8W0Y+XNvRAHbJknDl6bYIJ3Vdhcar4kQZjThFHZHfBpm6Gd9tY2yZBHJLdHTDhGN8CP9dNq6RlzwUxKnAVp/WMzkjojK4NqorOXvHGHpv1jcpvrUcl1ukFjztIcQxVyzEoKKvOOW60yMYIT51gUrUD9kVEdsx1EIETLVFzpQlxoVIHqU6J/YPOc4Q4/fnp1oVYAKKhai+pHTWEMgt+CONaXHAWKiuLHwLe/O8jqdy3LXcxPhk9qzrnAmxgRNc+H7HltV0W2cc3YQeKwMYxRH2DXDUZsIcbKlKcFn2lu5RgXgikyd8KEFiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWCIJNILym+xOGWKnlzTm2ieOhMKTMaZl+zGVSdBLns=;
 b=auXNNFsikHgOlrYP0wEFza67FGTyyOv0tgPAuLpDgdpbyzhw3r4zN1KShBiQIgrkDSxeB5NiAbcBRTkaUJhCQJcc3JN+TIm1eJx7FDbhcMvaA99jaLJiHOPtkfPSkuVpKZRxuD8oLBCS4k3QJwibijK3xtV/IOL8+eeiuLpEj+QBpJQc3zXO8t/g6WcO3NHskE2yDEz6lNHbekKuEdy+nlS5Nh+HQpHWxVlOs7EHq8ETUmxVZTSUNn8o+qE09jR0YYs4EMAtaDkMqY3irUN+unN/eiIG0wGjWpxaiGTgb9rd6/Q3YsTQljnFeMXx8uWfYVPYJDM+MKtWkIH7jM/RPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWCIJNILym+xOGWKnlzTm2ieOhMKTMaZl+zGVSdBLns=;
 b=AYZiqG8jIRv36OmgX0X3qXzei4zGQi6PGn3y01Ne0vwuNGUH8dpKOcJadxAiQGWHhI66AXx2EvbW/mB6jBKt9bdUNbAhcsYReUrUA90zej5Vke/zoAZ/meUHSAw+XCaMiDIC5+94ZKISQk7+zZIGZqLsm8KBi1Ci2ezuM8aExOE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (10.255.16.82) by
 DB8PR08MB3964.eurprd08.prod.outlook.com (20.179.9.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20; Tue, 4 Aug 2020 10:29:33 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023%4]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 10:29:33 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/wic: Introduce custom wks and grub.cfg for N1SDP
Date: Tue,  4 Aug 2020 15:59:22 +0530
Message-Id: <20200804102922.18691-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::35) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LO2P265CA0095.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20 via Frontend Transport; Tue, 4 Aug 2020 10:29:31 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8736ade9-5a60-48ec-872d-08d838614b5e
X-MS-TrafficTypeDiagnostic: DB8PR08MB3964:|DB6PR08MB2760:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB2760A4729BF4D04EB6B5AA79FA4A0@DB6PR08MB2760.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 nIYuLNh9nKwezDVrdue2l/N6p7HoBjhQcpPiFGHWdUq23r6n+v3pWL7aooPn/MJo2eYRjUX/WlAotbuq2TaBbMu0qGUMbVdkGhJA7fWO7gHpvfejv2JaYIoS5fFIAD6idwGfDc3QFsCo4bMjev7sfddaJmFw7ikTntd6uwqRYihEWKkqPZJm/LhgQW4KfLS5DC78xem88iYDw2Zimv4KrnymBaoPnVPA1DxuA/mD/f0+I4yYUDRBN8Di4ZKUhcK9/9hHYNpbbwfyHBUP8B7eeFz8i0Y7y+dhIh4ibQwTN/lgYbgf48/6006rW3U88BL9iDyQLqNjjlnE6atioRqeZ756mfw2O8WgHMVpnwAZAPuxyNs6WzQI6lXSWEc70mwMFTZLKYNnrpoxZFjFi2FIy5XnM9PnY0E6D894s1csZeg86OBoVLGCK9d3ayLGWgBY
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(26005)(186003)(52116002)(86362001)(66556008)(66476007)(6916009)(478600001)(7696005)(316002)(8676002)(5660300002)(16526019)(1076003)(2906002)(6666004)(66946007)(36756003)(956004)(6486002)(83380400001)(2616005)(4326008)(8936002)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 F6USTsy5xWAw4dPnB13ZJt7E34Jil3IBf0LVvZATgS9tu1b+2UCRw3alNouPn1b40Oe2W11rxftsFK6wXwwbZu4x09xeyCF/4nf58b97JIHkDiRyeZKopHWXIyb25jUSKf8+l6xs7jmEeR7RJyd16uFibEnURTXW56Ero5eQez9rAJ4EndG9Qy6DsCxun0uP3+JfGvrG0PExuO4k7Zh40+5YUEbXgOMl/u8iPGP9nSqp6jCkQjQM5g8hSQ8rh1egnQyWra5s+8HpmLAaI8/AmWz8CySC0DFXyR4Yf4CZ9IQ0B2QfbKrW6xl0MJ6ct9UsoTzNlw8Qjx23KV9EvnxjO2GLQqgWbIKqEH2vH+ujghE9PeU0t/MKXkTGI39NUDxMxpUuXOhAQe9wU7PWOY4D0LyJROk0q5NjVY9xgqETma8eSGbyNuwqm2qawdH9H2TDzlwQ8XwA/UBYoEOQwVcrQb2f+rN+hnip5AbxXENX4tNUXNF8LbugRbk6+X+wC7nXG8FXF1t26rotYh5R8psk6hPke8MSAsSdmXcTd/6bufZINtjIDACrb1k04XAhzLRTsktCgmqrQj2d9TUJls1gD9pKm0CFfsTIM8M3ffTMJBiE0FIGX4I9SjmCX5aRo9RnBpx4rhhncswyPZENagLvqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3964
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	efc068df-4494-434e-38d3-08d838614720
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CZTocWTDU3OXOyVgsM0i62g05+ZfRnrSmOYbUIHNwvXfu77KObhk68T6HOM1nFe0ajDRpqxYgwYpaWla4BQWiL6vfkhvqGjPvadS/FdP5wLP9hs5469Ue59yvmXEs8efo5Pyna3sqafxOfJSkzUIfoh47gl5wiBynYfJekPstrb9GedQJgJ7RG5dBEwHQSEFy1ODiNU+1qVQe8bSoBH7pe1g7UavagoFsmtWKib/fFyAVvGKmp3OeGCDsPKPljXmYgbBDgRDigPlmFzwsxK/vTNOxthJMmsiWike6xfv6O0lP0yEJuu+rUXmjeGJE/qyuNSvAR2VVmaAN/qkydj7nXfz1YT/Iur2fbJ/sMQ26KSnnhGvTKd8tZ8QXdxZu1qxEqVt2AoIWFWlkj3tXxeK2PcFG9QCPuO2CbSbM2JeurmIG3o2x+G35JPdJH+mL/WuZEmguAyQnp8LXl69YPQh1kpFMFw4FP0Zc0wLyj1m3zk=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(46966005)(956004)(2616005)(6916009)(4326008)(6486002)(26005)(336012)(47076004)(36756003)(86362001)(82740400003)(2906002)(6666004)(83380400001)(8676002)(5660300002)(82310400002)(186003)(8936002)(70586007)(7696005)(16526019)(1076003)(316002)(81166007)(478600001)(70206006)(356005)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 10:29:40.0334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8736ade9-5a60-48ec-872d-08d838614b5e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2760
Content-Type: text/plain

The standard canned WKS files like mkefidisk.wks doesn't allow
us to set custom grub.cfg hence a new wks file is created on the
lines of mkefidisk.wks to accept custom grub.cfg as config parameter
to bootloader command.

The custom grub.cfg allows user to select from different boot options
(acpi, devicetree for single and multi chip).

IMAGE_BOOT_FILES is updated to package n1sdp dtbs for single and multi chip
as part of the final image.

Change-Id: I29a64d0bd50d72d912cdcd99dbc593388be786bb
Issue-Id: PLATFORMS-3134
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf |  3 ++-
 meta-arm-bsp/wic/n1sdp-efidisk.wks   | 11 +++++++++++
 meta-arm-bsp/wic/n1sdp-grub.cfg      | 18 ++++++++++++++++++
 3 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/wic/n1sdp-efidisk.wks
 create mode 100644 meta-arm-bsp/wic/n1sdp-grub.cfg

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index a31f33d..506f3dc 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -16,7 +16,8 @@ IMAGE_FSTYPES += "wic tar.bz2 ext4"
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
 # Set default WKS
-WKS_FILE ?= "${@bb.utils.contains("EFI_PROVIDER", "systemd-boot", "systemd-bootdisk.wks", "mkefidisk.wks", d)}"
+WKS_FILE ?= "n1sdp-efidisk.wks"
+IMAGE_BOOT_FILES ?= "n1sdp-multi-chip.dtb n1sdp-single-chip.dtb"
 WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
 
 # Use kernel provided by linaro (Contains support for SCMi or HDMI)
diff --git a/meta-arm-bsp/wic/n1sdp-efidisk.wks b/meta-arm-bsp/wic/n1sdp-efidisk.wks
new file mode 100644
index 0000000..d1ebfb8
--- /dev/null
+++ b/meta-arm-bsp/wic/n1sdp-efidisk.wks
@@ -0,0 +1,11 @@
+# short-description: Create an EFI disk image
+# long-description: Creates a partitioned EFI disk image that the user
+# can directly dd to boot media. Uses a custom grub.cfg file to configure the boot.
+
+part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --ondisk sda --label msdos --active --align 1024
+
+part / --source rootfs --ondisk sda --fstype=ext4 --label root --align 1024 --uuid=6a60524d-061d-454a-bfd1-38989910eccd
+
+part swap --ondisk sda --size 44 --label swap1 --fstype=swap
+
+bootloader --ptable gpt --configfile="n1sdp-grub.cfg" --timeout=5
diff --git a/meta-arm-bsp/wic/n1sdp-grub.cfg b/meta-arm-bsp/wic/n1sdp-grub.cfg
new file mode 100644
index 0000000..12b77a0
--- /dev/null
+++ b/meta-arm-bsp/wic/n1sdp-grub.cfg
@@ -0,0 +1,18 @@
+set debug="loader,mm"
+set term="vt100"
+set default="0"
+set timeout="5"
+
+menuentry 'Arm reference image boot on N1SDP (ACPI)' {
+        linux /Image earlycon=pl011,0x2A400000 console=ttyAMA0,115200 root=PARTUUID=6a60524d-061d-454a-bfd1-38989910eccd rootwait rootfstype=ext4 acpi=force verbose debug
+}
+
+menuentry 'Arm reference image boot on Single-Chip N1SDP (Device Tree)' {
+        devicetree /n1sdp-single-chip.dtb
+        linux /Image earlycon=pl011,0x2A400000 console=ttyAMA0,115200 root=PARTUUID=6a60524d-061d-454a-bfd1-38989910eccd rootwait rootfstype=ext4 verbose debug
+}
+
+menuentry 'Arm reference image boot on Multi-Chip N1SDP (Device Tree)' {
+        devicetree /n1sdp-multi-chip.dtb
+        linux /Image earlycon=pl011,0x2A400000 console=ttyAMA0,115200 root=PARTUUID=6a60524d-061d-454a-bfd1-38989910eccd rootwait rootfstype=ext4 verbose debug
+}
-- 
2.17.1

