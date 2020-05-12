Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.77])
 by mx.groups.io with SMTP id smtpd.web10.8756.1589299007390788628
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 May 2020 08:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RTnlvEGL;
 spf=pass (domain: arm.com, ip: 40.107.8.77, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/ifQpfRmJdzWe2+8ns1wFHxp8rWWYuSB9Or2JhsnGk=;
 b=RTnlvEGLi4KkP9qqu5SHFD6lDkG3sfSDa0YjVspGpxc+yBHqzfnaQugfrVD0CBi3aXoz6qckZsEI552ZVZMGqYELswRzmMAIuoGp0PVgQAvGNfL+UwF6SJI7EwTpMlOA/RH69djgtQJ756aKJLoyAuaFPvqtmgXob781Y++0HOw=
Received: from AM5PR0502CA0014.eurprd05.prod.outlook.com
 (2603:10a6:203:91::24) by DB8SPR01MB0025.eurprd08.prod.outlook.com
 (2603:10a6:10:11d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26; Tue, 12 May
 2020 15:56:44 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::3) by AM5PR0502CA0014.outlook.office365.com
 (2603:10a6:203:91::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Tue, 12 May 2020 15:56:44 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Tue, 12 May 2020 15:56:43 +0000
Received: ("Tessian outbound 567b75aed2b9:v54"); Tue, 12 May 2020 15:56:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1ef1ad91afe793b2
X-CR-MTA-TID: 64aa7808
Received: from c70dba6d49be.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B261EA7E-1363-40E9-9F8E-ECD0FDB187DA.1;
	Tue, 12 May 2020 15:56:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c70dba6d49be.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 May 2020 15:56:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6aGzH3wbtongcuAYJLr4N7wdZyOAjJIsdhuc1ghyNglbq0or/9Ih1M+7Dww8IogJPTU8tMehHBaVsx11qaZlhLlg/uZoRREi1Lz+QxbxcM6gLYOyJ4OukjIuh2idMWH1U/hWWs/NyyJEGeY8xhT2+9Da2kuBAgDFkYOxmx6gOgoTYJv1BKkY5raC9LtTsgHj/Zag05rgRpBN/OgfcJ41RXzLtM75fR4suaUSfSIojlNtw1H3kjn7qa6h2hS7fGyWhL9OKXdBU6lLZEdjDHPhSKuggcEHUQsaenA7GnHrRljC8UedYXXD1Qt0p2d+gPESuXxTnmzg5HJv6AdD8+Fsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/ifQpfRmJdzWe2+8ns1wFHxp8rWWYuSB9Or2JhsnGk=;
 b=SMCHQSOgQX/vPT0lm1pjDt3LqByzYZVsfA4XC/l+0LbQ++FUQD+JWf6S5ThmjGvcGVCvq8QgT4u1WUhdu1HzunAEFTjyMboOmvqkGhLq+MqL3Z7ka2W3ED1fI1vDlTJlXwiSzkTZIIVd87IaBlIcssi1DBJDKlMcZ4KjgnfqMOMx+1D3yWPLM5Y4tbwRNnidSPg9nLxnmyld7LUyZ4mXUb64cusOkxxpGJV3vjj48qSycJrG5PIR+J4Oocq8ktfdwvtAnK6GWdP+sIrOlpB89banwL0amM8O7JCq4LLt6UjfTp3mJNc6dfXUxD0uwD4dhI07PKpW25dnRRFJfApinA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/ifQpfRmJdzWe2+8ns1wFHxp8rWWYuSB9Or2JhsnGk=;
 b=RTnlvEGLi4KkP9qqu5SHFD6lDkG3sfSDa0YjVspGpxc+yBHqzfnaQugfrVD0CBi3aXoz6qckZsEI552ZVZMGqYELswRzmMAIuoGp0PVgQAvGNfL+UwF6SJI7EwTpMlOA/RH69djgtQJ756aKJLoyAuaFPvqtmgXob781Y++0HOw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4033.eurprd08.prod.outlook.com (2603:10a6:208:133::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.30; Tue, 12 May
 2020 15:56:36 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 15:56:36 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp: n1sdp: linux-linaro-arm: Disable CONFIG_EXTRA_FIRMWARE
Date: Tue, 12 May 2020 16:56:35 +0100
Message-Id: <1589298995-67540-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0355.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::31) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.55) by LO2P265CA0355.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:d::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3000.20 via Frontend Transport; Tue, 12 May 2020 15:56:36 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7b076363-14e4-49db-c2c6-08d7f68d1133
X-MS-TrafficTypeDiagnostic: AM0PR08MB4033:|DB8SPR01MB0025:
X-Microsoft-Antispam-PRVS: 
	<DB8SPR01MB0025D9412AF0616AB7FF16C992BE0@DB8SPR01MB0025.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:466;OLM:466;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ZnD7sXAq1hBgyd8U+Ab4Wnnyvw+axBjIzdol4M6RnA/HkrvtlAtlDGOIN5CQcSHGvH0wzeqVF95TE5FcSigb3NVuCuPI3qcJd0N6T+RWNSLxv2+ttsldMhIUd2Bdz9VVFD2Pez+n8mLrtXM9JjpizrSGJ9abjdzmk7030CjyWROiYugOIAbVQB5IhlHO+xCZ4mGlOlpbqZZVhO6YBSuxd4hQ7g+/DROypzp/MBeZyhVtGcVBxqRm9b6eMbSVbEoD1zJoKelfatS31r4Yk3smLoFVa6e75aXBGxfdvFAfbjzy4pr13pTelMLYPewBxPQI9RISx1axvLJFXLRwgsnx5M9w9naDhhyeUZm9i5BYhPNYqOlJv0aPvOccLnRDk2GTVKrhuqwlXxJ2ToYMYM+5+dGmhmIFe4OJgcDT7N0vNJN5ixQ68X172dHX5wr8kSVXL509wE9gWwE+J4vv/wKQMjsfvzQA5laoI4ICemZPPetu7DGrF+oqsOOZZGoHPRpYLUZzW8Ze3kEKxddb5DLxzdzQUEx/MTvRvL3VyZaIlbIvLN0x2cTVqUu1S0xhaboA
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(33430700001)(7696005)(66476007)(52116002)(478600001)(86362001)(44832011)(16526019)(186003)(6916009)(316002)(4326008)(26005)(33440700001)(5660300002)(8676002)(2906002)(2616005)(8936002)(956004)(66556008)(36756003)(6486002)(66946007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 C9xVGGdEPTti02Vflrmfc5ww2bhd2kAW6bedN546d02n9kQwV1LdOjG/0XSzzlK/3gJ7k7wT2IHw3UQ69I2b7S8sZaRReYi3wGYPscn//KHQSsLRarulsO0dHFcw+C+MyTfB8/Pi8UtZz/yDAwtU2fcr66xzJipS9nE8S2oE6qJTafMhhzL4w5oiF3Iv63aQqRAk/xxyyQuPnKkBqIrnByZzj1SIk0APyF6z3A7/zRH/jyJxiDbPEoYDWlO3fL7jyKYLpAjzlzx0A9p8mIF5vmf0WZrnZgdaZUN8/8kDBGOnmTjuBzzx/yBDs5lB7En98Qbyo4W1dzVrIGpJAv0ZvLSxTnpPlzJRAfI96/hucZeTmy/QCd+A6klnFPvLzo6gzlEyTdbK/PAh8M/wXbxfArZPrs7NJrwMZy2o3j6cHWSnfs6gGiiDMew5KPJIRIXeOFkem1uPlH8efyEKNYI7S9oZV5M2sU0BVWagEAfNyWsu+PwYuXuX/fLPys6JXv9G
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4033
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966005)(33430700001)(82740400003)(70586007)(16526019)(86362001)(47076004)(5660300002)(26005)(70206006)(478600001)(6486002)(7696005)(186003)(6916009)(4326008)(2616005)(956004)(8936002)(8676002)(36906005)(36756003)(2906002)(81166007)(336012)(356005)(33440700001)(82310400002)(316002)(44832011)(32563001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6a571c6c-5974-4434-2c8e-08d7f68d0ced
X-Forefront-PRVS: 0401647B7F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oAtEVFH/S0aPhlPxmofhgIz6U+RwfTS+RpdYY5ikhRC37auk/V84ADwSlr1e02KVCif3b8QlMFfS9vzl6YsIAEF8EYves6J7WUoP3IuJuw1v0AQ353Lz9YdCc28ppO8PuP9+yD8N9rtAkVxvhrvP8MFMwCpsnKJqjEsBfX9C5VWTrIIq4BYKquznqS1GRYOtOWX8BHFz52vnPGRO+vPyBDlHo+zEamBx2R/nmbXREOXlMR/8H2zDaV4Qj/U/KWsEc+GtE6Ndg2s/ve8rz22ZW7Sk4CQcU/7+2IgJw8UdG0ioty7hh1hj0rL68GS8PzfYanXn7bYZ3EGl8wr3XxSc4F3zQR62ufF6gCBsZujhvj+wrcj5IoiL9CdKCwWQfgWsAWQxW5smT+OpTOBAeCkd3WU8wFfJKIlEEHULfBYQrUF7AzgPOKb0ffIsmMV87UWODoCudby6Bn+d5VXrpLrcf3c/KlvEwbvYye0FysxLkuk4AM4Vu48NxsrxQ00DER47a1qAbEYOx72LEH+7+7ipxO/MeK52ZUx15zm5prDt+GXKZnFE9wlZaGmTyAcOnRQTk/Lg59SvatynDmAGhBWKuAhz23XzBhDfP9E2tivXCmc=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 15:56:43.5067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b076363-14e4-49db-c2c6-08d7f68d1133
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8SPR01MB0025
Content-Type: text/plain

We don't want to build firmware blobs into the kernel binary. Also,
add linux-firmware-rtl8168 package to MACHINE_ESSENTIAL_EXTRA_RDEPENDS
to have it installed in any image by default.

Change-Id: If8a88a4ccbc6d474438a2555498989695a4b19dc
Issue-Id: SCM-954
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf                                   | 3 +++
 .../linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg              | 2 ++
 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend        | 1 +
 3 files changed, 6 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index b19fb86..5fddcad 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -18,3 +18,6 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 # Use kernel provided by linaro (Contains support for SCMi or HDMI)
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
 PREFERRED_VERSION_linux-linaro-arm ?= "5.4%"
+
+# RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "linux-firmware-rtl8168"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg
new file mode 100644
index 0000000..35afddd
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg
@@ -0,0 +1,2 @@
+# We don't want to build firmware blobs into the kernel binary
+CONFIG_EXTRA_FIRMWARE=""
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
index 9634d43..0f516c7 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
@@ -11,6 +11,7 @@ SRC_URI_append_n1sdp = " \
     file://0002-pci_quirk-add-acs-override-for-PCI-devices.patch \
     file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
     file://0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
+    file://disable-extra-fw.cfg \
     "
 
 # Referring to commit TAG N1SDP-2020.03.26
-- 
2.7.4

