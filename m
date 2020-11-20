Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.51])
 by mx.groups.io with SMTP id smtpd.web10.23940.1605872261860706666
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 03:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=9/rAoC7R;
 spf=pass (domain: arm.com, ip: 40.107.20.51, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fygWvmrWgC6eG+pXy7BZx7W0kggsFOr7VE78LqftLOA=;
 b=9/rAoC7RYOlZMsqzUKLlM9YDKru4/caNRwwHwbwP4UQ0NRnoPKErg7LOeyXC2pCFD/ADwsonKPZa7c9r58IShnQS9FayxmYW/IK/CnkwbBl1AdzUWQuHN3wWwTbaALYPdwwwgOrba5nuLlJ5U3bV0I1IgGduxnZ34PcnT34siaQ=
Received: from AM7PR03CA0018.eurprd03.prod.outlook.com (2603:10a6:20b:130::28)
 by AM7PR08MB5527.eurprd08.prod.outlook.com (2603:10a6:20b:de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Fri, 20 Nov
 2020 11:37:39 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::4f) by AM7PR03CA0018.outlook.office365.com
 (2603:10a6:20b:130::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Fri, 20 Nov 2020 11:37:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 11:37:39 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71"); Fri, 20 Nov 2020 11:37:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b217783c0faf8c01
X-CR-MTA-TID: 64aa7808
Received: from 0a580dc13a4c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 10DDAB98-64A9-4C02-B1CF-AAAF55C2FEC0.1;
	Fri, 20 Nov 2020 11:37:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a580dc13a4c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 20 Nov 2020 11:37:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOpg7Poxw62GE3SO9QLNjM3fVJmgfx6oxTjw2oa4UPDzcO6WzK52ZjssiO6JyOqIJYBvtR4yO/OPneDCVXSsn1sLstoH5dZcLD+tdPf0009rRFpfR95ywuBbC1GbML0HMm/XCAAE1e3E8puCof4ehMZAi1u9PCMzobW2F6vgvfTR+f3ME968Jczv5WJgjRfwJwYozUFN54G2Dj78tKCzV5tbP3H3GlkxuHsVMtiBIeJqB2Koc4fu+MOzuPpOTfS9agCXIOUZLZa/QSoAlegmj86Q1E8LhJ09VuYmQxlZ7KJQnUjSuiNmR5SuCUixM+BY8FaDjNyokqtbqzCxVtJsnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fygWvmrWgC6eG+pXy7BZx7W0kggsFOr7VE78LqftLOA=;
 b=NzJJS7LmYJU6dUarGwwxewE3twwGgk6KpTGsIx6iz2kPQ3y06KCAJ5Zb2105s5WXXUTk0eoOpiklRSTyUO+fto8iyUF+4c3bBVc9XuksvhAtTkaB/lnoDhg2T3bHZmbHPXH9GmeQgn+R76NQHXO/wwSM4r07wox+JwvpbtDJ4VURYNrRVtYKi/+LQRq6mq2dUn6v/Oe2CgYNmoybXRFXo0fdcJ/YjwKwXekPz8pr6pJPCRdOUYkCf5N6YEipto2xUu8tmmOEZP2W/MDQoKo1Q+JzbIN0BzMHGe6wgzAvtXUI7ANb+rJa+ckA3bjPfPl7Bt7UUSQHKJRCSZIFdQSRpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fygWvmrWgC6eG+pXy7BZx7W0kggsFOr7VE78LqftLOA=;
 b=9/rAoC7RYOlZMsqzUKLlM9YDKru4/caNRwwHwbwP4UQ0NRnoPKErg7LOeyXC2pCFD/ADwsonKPZa7c9r58IShnQS9FayxmYW/IK/CnkwbBl1AdzUWQuHN3wWwTbaALYPdwwwgOrba5nuLlJ5U3bV0I1IgGduxnZ34PcnT34siaQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DB8PR08MB5516.eurprd08.prod.outlook.com (2603:10a6:10:f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Fri, 20 Nov
 2020 11:37:32 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::7481:42d7:df72:b159]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::7481:42d7:df72:b159%3]) with mapi id 15.20.3589.020; Fri, 20 Nov 2020
 11:37:32 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm-autonomy/xen-devicetree: check if kernel Image size is correct
Date: Fri, 20 Nov 2020 12:37:25 +0100
Message-Id: <20201120113725.30265-2-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120113725.30265-1-kamil.dziezyk@arm.com>
References: <20201120113725.30265-1-kamil.dziezyk@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0486.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::11) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO2P265CA0486.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13a::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 11:37:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3d731096-beab-4684-6d6e-08d88d48af9b
X-MS-TrafficTypeDiagnostic: DB8PR08MB5516:|AM7PR08MB5527:
X-Microsoft-Antispam-PRVS: 
	<AM7PR08MB552754AC873B01B97C8C19A7FDFF0@AM7PR08MB5527.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 O2e0HFLXMQnY3VYIFEbVKIKr938zyfADrq47dq8jMFZWhQE0E9sgPW+nOJGQWhxR4vdVDWqxq26odAcXcok77xaD390KKMRB6aUTuuyv+MUKpEVWItjJMjQ17LFXaMhd7JjigCkdkkZ/BHf6tMPl2ctyx5kD3tsIm/Ur8yn7mcQfwUc0Htj7pIxmqvxTn6oGhLu2D0+CC4VG8eqyR6kkwx+MfAKVtau56IHQCbFmPWpiTYuvSd+b/3Gr9V02gqY2Wd+N2vesnP7KfUNz38W0d4VAn1SBcM6t1QBzLyupUDQP16GrHW0lnFq73ImFNpCaMN42pdeXFYHxaXBuYi9d0w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39850400004)(366004)(376002)(26005)(44832011)(1076003)(8936002)(2616005)(36756003)(8676002)(6486002)(956004)(478600001)(86362001)(316002)(186003)(2906002)(16526019)(83380400001)(7696005)(52116002)(4326008)(6666004)(66946007)(66476007)(66556008)(6916009)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 OqwbL8ICt0JCLfA4GQbVxmxT8Su842CmoQ7IJYOAcqT+Z1Yj/QKZ6vypo8v3H2qGhc+4rt851iQWhLrbzMXSgxvXiF7YD9JeCjBFl7zot1AWeFMGM8bVreXeEj6+1ULDiz4p724kI3SSPTaj7OtpxUAI5iQGuuG94h8aR3ec9lUrr/QpmEWa0AFgyLp00DIpwf8wvo1UqgqCpZL5vSDu2bZt+yOJys4G3sGX2oaZFomROGsI1tU0RiWLdcooXXoNM95M79abLgjYgvyr7G6pM6kOziKnQeZlDbiQNZyru0TlE0ntdlONFWT/tVUP+QEosY3/EwUUeM9kkPHXeNOFWADCk2+WbALtiFEFzKrDvCYgwPQfMjNvDaZqMhZvzWvmz2Zj1qApjzpGpoesrkoDbl/wxY5lVACkPPeOXX2y9eQce+z4jW2YNJQKKtXaLIm1uVrCjI7hrihElCE8l7DskQ6FmFgrkrIBT9QvdYdWGLAAaHc6g+RaBs4p3MqOv2oU15BX2NwJjggo8c2sSDSsOczFVxISl+gDfOoFugUHc9BO9PumyKAzVMUvmDdZnXlvzJ59LxSmDmsQ7JA/+oWOD5q9YcSldlaQvTM6n1GLPTbqyifAsR5Kg0zb1wq6D9bVWdtDCmmok9c8SghJBjNuMcd7Cc8KOzNY7Sx/JC/4v1puF2b4aDO2uFA8K0+ySUTRl2Ygmqo50lhnWllgSGrwYvuLvzRCR0iE7i9tpiFKZTjfrr367lWKaRqEgEKKNDJyavWbf5HcB0cg3FYdx4Hpr0xbmFL76gWVAFgp4bD8BpEGtW3ewCkvUZyGedSUr+5UKuPNPg72riGEKWXe7eWUdEOyFID85/G9I63IYqFMO3W+2wXdrUHVhR9NQOvaBca2jtKYBLAnH2xMnx4B63LQEg==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5516
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2cccb11e-2ba8-40bf-75b9-08d88d48ab44
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BQk0gY8e9QB01YGK4kcB8FZyOfvD39J1Ba9gtM1YQrX7J2Gby3qVbBu9OnJiTJd2CjRoBjlCQZK8kA/O1/12TN+QqEkDaVL+O7HzjTL9gFCBcV0Ku9v6wLrSCXE6GDYQeo167UALQDC5Le0V9uljw5lEvdEH8ZpIjJaxtE8wlW4hI9bJhxXCeO0Stzc3RDURvWIFBANl5wUHn2kWo8IiQTL4a39b6ov7A6FxHdMxuegspCp7WcNmj58xRVaDIoHTL4wXcatLc3LZ2Vri2/J0Pi6+ecLVpSV3HmM55lIYOaU2uI/YYAg9s/KeaD82FT5uHsVa01jVYETnIW40tpMuUpdVXm8J46AGEWHsDL8OWxsza0nzg3bMUblGxTN6LGdHTyvJHboTATVZ7Clg8sSqAw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966005)(44832011)(86362001)(2616005)(956004)(186003)(356005)(7696005)(1076003)(82740400003)(16526019)(8936002)(26005)(36756003)(478600001)(36906005)(6666004)(47076004)(4326008)(316002)(336012)(6486002)(6916009)(70206006)(82310400003)(5660300002)(81166007)(8676002)(83380400001)(70586007)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 11:37:39.5676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d731096-beab-4684-6d6e-08d88d48af9b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5527
Content-Type: text/plain

This patch brings following improvements:
 * Adds a check for kernel size defined by XEN_DEVICETREE_DOM0_SIZE variable,
   whether it is greater or equal to actual kernel size.
   If not, bitbake warns user and adjusts value of XEN_DEVICETREE_DOM0_SIZE.
 * Adds 'virtual/kernel:do_deploy' as a mandatory xen-devicetree dependency via
   XEN_DEVICETREE_DEPEND variable.

Issue-Id: SCM-1567
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Change-Id: I4f250172f1fa599b7a3673ba0887cd49372b7556
---
 .../xen-devicetree/xen-devicetree.bb          | 31 ++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
index ccbb387..0369b96 100644
--- a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
+++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
@@ -14,7 +14,9 @@ DESCRIPTION = "Add entries in DTB for Xen and Dom0"
 
 # Please refer to documentation/xen-devicetree.md for documentation on those
 # parameters
-XEN_DEVICETREE_DEPEND ?= "virtual/kernel:do_deploy"
+# kernel size is passed to xen via xen.dtb so wee need to add
+# 'virtual/kernel:do_deploy' as a dependency
+XEN_DEVICETREE_DEPEND_append = " virtual/kernel:do_deploy"
 XEN_DEVICETREE_DTBS ?= "${KERNEL_DEVICETREE}"
 XEN_DEVICETREE_XEN_BOOTARGS ?= "noreboot dom0_mem=${XEN_DEVICETREE_DOM0_MEM}"
 XEN_DEVICETREE_DOM0_MEM ?= "1024M"
@@ -67,6 +69,33 @@ do_deploy() {
     done
 }
 do_deploy[depends] += "${XEN_DEVICETREE_DEPEND}"
+do_deploy[prefuncs] += "calc_xen_dtb_dom0_size"
 
 addtask deploy after do_install
 
+python calc_xen_dtb_dom0_size() {
+    from math import ceil
+    size = 0
+    if d.getVar('KERNEL_IMAGE_MAXSIZE'):
+        bb.note('size calculation based on KERNEL_IMAGE_MAXSIZE')
+        size = int(d.getVar('KERNEL_IMAGE_MAXSIZE')) * 1024
+    else:
+        kernel = os.path.realpath(d.getVar('DEPLOY_DIR_IMAGE') + '/' +\
+                 d.getVar('KERNEL_IMAGETYPE'))
+        size = os.stat(kernel).st_size
+        bb.note('size calculation based on kernel Image file: %s' % kernel)
+
+    bb.note('size in bytes: %d' % size)
+    # Ceil to MiB
+    size_required = ceil(size / (2 ** 20)) * (2 ** 20)
+    size_defined = int(d.getVar('XEN_DEVICETREE_DOM0_SIZE'), 16)
+
+    if size_required > size_defined:
+        bb.warn ("Wrong kernel size setting inside xen dtb!\n"\
+                 "Required:\t%(req)d (%(req)#010X)\n"\
+                 "Requested:\t%(def)d (%(def)#010X)"\
+                 % {"req": size_required, "def": size_defined})
+        bb.warn ("Overriding XEN_DEVICETREE_DOM0_SIZE with "\
+                 "%(req)d (%(req)#010X)" % {"req": size_required})
+        d.setVar('XEN_DEVICETREE_DOM0_SIZE', hex(size_required))
+}
-- 
2.17.1

