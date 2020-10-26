Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.88])
 by mx.groups.io with SMTP id smtpd.web09.11069.1603710765526634197
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 04:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=C93uH9Uy;
 spf=pass (domain: arm.com, ip: 40.107.22.88, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63BuJpz3pBJrirL0s1fiXYA/i1hQGtd6ahBfOM+B+oA=;
 b=C93uH9UyCx6ZcRH7t+dXKMTUUwGPbUAcoPuF/3TC5IzQpilkCeK3VzQWhXidmY38STZFqmqxeAVCqKXPER03k2VSpWznbnIZb7rzwoCzTVC3IPpLjvi5Sb5qDFRCuijZ0NlFkR9j8UswLJN1B60iKPJkyEGS8YKx1+hiY16OJOE=
Received: from DB8PR06CA0034.eurprd06.prod.outlook.com (2603:10a6:10:100::47)
 by DBBPR08MB6234.eurprd08.prod.outlook.com (2603:10a6:10:202::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 26 Oct
 2020 11:12:41 +0000
Received: from DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::82) by DB8PR06CA0034.outlook.office365.com
 (2603:10a6:10:100::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Mon, 26 Oct 2020 11:12:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT039.mail.protection.outlook.com (10.152.21.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Mon, 26 Oct 2020 11:12:41 +0000
Received: ("Tessian outbound ba2270a55485:v64"); Mon, 26 Oct 2020 11:12:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4cfaa8b41eb0ca2a
X-CR-MTA-TID: 64aa7808
Received: from dec16f4038fc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5D649F7E-C1F1-4A0A-85EA-288919D7E17D.1;
	Mon, 26 Oct 2020 11:12:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dec16f4038fc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 26 Oct 2020 11:12:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlRX9tr1a1LuKuf8PS8I5REUgUIbLkE/qvrKRePhP7xYlLLLm86J/gvcFc4uAoTrDFLDhMIxLQiQwYMfmCgK6aU98sx2c34XSz5ZVZwCzWOA1bo227YROcBKisR2fACKm7gXf2/2zEipEUNwgoUSRzRqSl9UaF/8oJ6NWRT5MxBYupKJd3mXSgBeGMHmr28wUd5Z8VezKM7oUjedn6jWIkyf9noF1S+hpnITTn7aHYIOmOlIiQ0LmbC28OjPBt7j0l8+7clol30Q7zOq9G8NNG8QgQX5of6FLVzVHtBIhGlGlyaoNnWqy9txcxzrUPEbDLZfJGoT6ByT48UPfeewug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63BuJpz3pBJrirL0s1fiXYA/i1hQGtd6ahBfOM+B+oA=;
 b=e9RVrkjxkgeNSFjmEpRozYCR9P3g6gwY3fSdpqu7gos+M/JmgCRtu1vcbB3GOHOd8aGuz4jgSzOy8T60LznbmwADRetEz8ogReyXxKFMcZnvPX/8L1lUgFzVkCWK3lgeA5POJOAYFqf5R6jGDjdQue+oB6zuK9EZoPAdi4O82o0vLtpNLGeGsCvJzyN30FeCGlWLZk/PkCOFU8ZAw2FdLga1GPZpt3jk3BqHjZ2RSJDv5j3FvdOI5UTOZq7OowJVlKsbycHmTkWewWcMcwUOY/IaSL7kIBfiVroy6Eh6b+6jtGYq+AoTJDlVLde9WYWcImUqRZzdM2nGtWRI4SOONg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63BuJpz3pBJrirL0s1fiXYA/i1hQGtd6ahBfOM+B+oA=;
 b=C93uH9UyCx6ZcRH7t+dXKMTUUwGPbUAcoPuF/3TC5IzQpilkCeK3VzQWhXidmY38STZFqmqxeAVCqKXPER03k2VSpWznbnIZb7rzwoCzTVC3IPpLjvi5Sb5qDFRCuijZ0NlFkR9j8UswLJN1B60iKPJkyEGS8YKx1+hiY16OJOE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB5239.eurprd08.prod.outlook.com (2603:10a6:20b:e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Mon, 26 Oct
 2020 11:12:39 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 11:12:38 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH 1/2] arm-autonomy/xenguest-manager: source init scripts
Date: Mon, 26 Oct 2020 11:12:22 +0000
Message-Id: <a71da05f15122d0b28f6b6186c67f79dcd8ea973.1603710589.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.52]
X-ClientProxiedBy: MRXP264CA0039.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::27) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.52) by MRXP264CA0039.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.18 via Frontend Transport; Mon, 26 Oct 2020 11:12:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dfb6fe49-4a92-4970-56f1-08d879a00e12
X-MS-TrafficTypeDiagnostic: AM6PR08MB5239:|DBBPR08MB6234:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB6234F4F3833D37165861A71392190@DBBPR08MB6234.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fB1gbuuBBLyuvJ4zGYUSNnnxF/VQsUoWiWE82zUdUrlEM92LX5HH182GbDcpnKFSHPjF7+pOhnTXbLHzXOX9q1pvys5sAUGxSmeqIUq7OzQDDSs4FUdD+12VuYew2wzqxFYKL0bOVTNpFr5gqnt0dXJ94P66yzG8MNSQmDxXVoKRyt1Mw8SXwLyFDBd3kXrTxT6czjiSCBCVMolx4z3h85TPh2NXOJcb67GRJ0oWEc7TAkH7X+vVQ0wdY2Mn2/hbxWIY1Zj5QWPZx07/jy6E9Ho2Z2qy8SHMZll2W0dfmUEsuqAbwVL8p88xXmvZmtPFIfCm88LCOtUY/mZcdtutcQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(6666004)(44832011)(6486002)(8936002)(4326008)(36756003)(2906002)(316002)(8676002)(83380400001)(66476007)(86362001)(478600001)(52116002)(16526019)(5660300002)(26005)(66946007)(2616005)(66556008)(7696005)(956004)(186003)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 JBy1EdpDMa/VaazdQnrr86moOgeNy0NmnNde6c5ITLK6ZwEMcWiQGVfrW9yvgCP/n6fAbzVS2XVgzHUai7LIc0xHNSKEsSmPcZ4O92drEk7NNb3I95whR2vv68KiV6eim1Gpmfx2xn44x2fNDkH0fWGKUSq0XnPvEXlr6cmsuQyJhi4UMwUaW3LxlZ5IdvBpuUNOZ2YrJM5JyHumK7lSkufkoILiUBA9KF/Aco5Nq1G0eE5rPpwyTqDmUEX62XAoJMNm50//FWrWgsQ2L27UgEQ2Mm6tjfD9oIjV0BtI4i8Wyu2XYZ3BC66Rg8dOzgYdlPltPpLlMnvyLXkQUFYWHb7bpPk3c4ALyZ8mYhvr+xqPHYFKSL8sZaEEygM6XjXWv6X5YnySPtQhLbkeCYGPzd/QaQMLhLAcMMWpoSwcVC9ykslWNJSSjBO1ZipM+wO4X2uQG27TifTppILdcyh1Dd7V631D/vldOZK/GAmV0NtnSXirK8GHVGBqtE4wCn/PwymJPNNZhAkgs8GlQ/QZ7BDiWxCVA1fPNLJxi6nP5mZRRnt04KCiJBbJq/9X2f9qTHqeBMvBvpzmJmpKPesRWy2Rg+/Uxcs9qnrHWSNLprOuzL46zALXiVEzBJtfRPih8NmcLNdKTIVsDpF7mZVEBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5239
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	20107a82-99f2-47e3-3e8d-08d879a00cb3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Oa4yDdhPc70fcB6iuPdDd6IRYwXgrfgZYP3jMnopP+T2TAtnIa0XiUCkp+pYtu5tLrQdO7Ml9R1iNcYD3u6HFrNzIqT/H3Pm/qQpjmH+opDt41GDTv8ixTsuaKlv2zkX77FwLqH7OM00TAoq+olFBuEC6ZKmwQ1u0p+X/zmhsQeoFaiLmrhImwYSEZpvmR2hKnRYVrx3UlyJrNNtFe8/83gwg/4tK42v+6xLxnmAE3f+BM7z4NQtpuQMvpD94EgyVgpbv0rg490ZptqyJlD37zGa/cBf/sBkEkxnprSzjToOaE10HjVUQ8MqjVe3xVAb6RtaKRRtLCCpUdNx2ViKTjA+NNjSZ1VL0RPkP2f5W/3J2c3XE2KMg/K9wSyRXinO52ZYyrQGxUupB6LcJEWjgg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(136003)(376002)(46966005)(16526019)(36756003)(44832011)(478600001)(6486002)(186003)(6666004)(26005)(70206006)(316002)(82310400003)(82740400003)(336012)(47076004)(81166007)(83380400001)(70586007)(86362001)(8936002)(2906002)(356005)(5660300002)(4326008)(956004)(2616005)(7696005)(6916009)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2020 11:12:41.0656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb6fe49-4a92-4970-56f1-08d879a00e12
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6234
Content-Type: text/plain

From: Nathan Dunne <Nathan.Dunne@arm.com>

source init scripts in xenguest manager instead of executing
directly, so they can immediately access functions and
variables from the parent script.

Also added a check that init scripts are executable, and will
skip if not.

Change-Id: Ie6bbb1b480a7bfe5af095addcf1aefd122b57c50
Issue-Id: SCM-1587
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
---
 .../documentation/xenguest-manager.md              | 38 +++++++++++-
 .../xenguest/files/network-bridge.sh.in            |  9 ++-
 .../xenguest/files/xenguest-manager                | 68 ++++++++++++++--------
 3 files changed, 82 insertions(+), 33 deletions(-)

diff --git a/meta-arm-autonomy/documentation/xenguest-manager.md b/meta-arm-autonomy/documentation/xenguest-manager.md
index 387af94..93453bf 100644
--- a/meta-arm-autonomy/documentation/xenguest-manager.md
+++ b/meta-arm-autonomy/documentation/xenguest-manager.md
@@ -48,16 +48,16 @@ project compilation (those can be set in your project local.conf, for example).
 
 The following parameters are available:
 
-- XENGUEST_MANAGER_VOLUME_DEVICE: This is the device path used by the 
+- XENGUEST_MANAGER_VOLUME_DEVICE: This is the device path used by the
   xenguest-manager on the device to create LVM disks when guests have a disk
   configuration.
   This is set by default to "/dev/sda2".
 
-- XENGUEST_MANAGER_VOLUME_NAME: This is the LVM volume name that the 
+- XENGUEST_MANAGER_VOLUME_NAME: This is the LVM volume name that the
   xenguest-manager will create and use to create guest LVM disks.
   This is set by default to "vg-xen".
 
-- XENGUEST_MANAGER_GUEST_DIR: This is the directory on Dom0 where the 
+- XENGUEST_MANAGER_GUEST_DIR: This is the directory on Dom0 where the
   xenguest-manager will look for xenguest images to create during init. That's
   the place where xenguest images can be added to have them automatically
   created during next Dom0 boot. The xenguests found there will only be created
@@ -65,3 +65,35 @@ The following parameters are available:
   name).
   This is set by default to "/usr/share/guests".
 
+Init scripts
+------------
+
+Shell scripts can be executed on the host when a guest is started. Depending on
+when the script should be executed it should be installed in a different
+directory on the target:
+
+- /etc/xenguest/init.pre  : Executed first, prior to guest creation
+
+- /etc/xenguest/init.d    : Executed after guest creation, but before it is started
+
+- /etc/xenguest/init.post : Executed after starting the guest
+
+Inside the directory, scripts will be executed in alphabetical order.
+
+Since these scripts are sourced by xenguest-manager they can acccess functions
+and variables from the parent file's scope, including:
+
+- ${guestname} : The name of the guest being created
+
+- ${guestdir}  : The path to the guest directory
+
+- ${LOGFILE}   : The file to append any logging to, e.g.
+                     echo "Hello, World" >> ${LOGFILE}
+
+Sourcing also allows the script to access params.cfg.
+
+
+An example of how to create the directory and install an init shell script can
+be found in:
+  recipes-extended/xenguest/xenguest-network.bb
+Where network-bridge.sh is installed from network-bridge.sh.in
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
index 752f498..42ccb70 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
@@ -1,14 +1,13 @@
 #!/bin/sh
 # This script is setting up a virtual network interface connected to the
 # xenguest-network-bridge if NETWORK_BRIDGE is set to 1 in the guest params
-
-guestname="${1}"
+#
+# Since this script is sourced by xenguest-manager, it can access variables
+# such as ${guestname} from the parent file's scope, as well as those in
+# params.cfg, for example XENGUEST_NETWORK_TYPE
 
 BRIDGE_NAME="###BRIDGE_NAME###"
 
-# get guest parameters
-. ./params.cfg
-
 case "${XENGUEST_NETWORK_TYPE:-}" in
     nat)
         # Create the symlinks for the files that vif-nat script expects
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
index d55c9ff..4d59845 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -475,6 +475,9 @@ function xenguest_guest_start()
 
     # Build init script lists (ignore non existing dirs errors,
     # sort alphabetically and run global scripts first)
+    #
+    # These scripts are sourced throughout the start operation if they
+    # are executable
     init_pre="$(find ${XENGUEST_CONF_BASE}/init.pre -type f 2> /dev/null | \
             sort) $(find ${guestdir}/init.pre -type f 2> /dev/null | sort)"
     init_d="$(find ${XENGUEST_CONF_BASE}/init.d -type f 2> /dev/null | \
@@ -484,13 +487,18 @@ function xenguest_guest_start()
 
     # call pre init scripts
     for f in ${init_pre}; do
-        echo "$f ${guestname}" >> ${LOGFILE} 2>&1
-        $f ${guestname} >> ${LOGFILE} 2>&1
-        if [ $? -ne 0 ]; then
-            rm -f ${guestname}.cfg
-            popd > /dev/null 2>&1
-            echo "${PREF} Error during pre init script of ${guestname}"
-            exit 1
+        if [ -x "$f" ]; then
+            echo "( . $f )" >> ${LOGFILE} 2>&1
+            ( . $f ) >> ${LOGFILE} 2>&1
+            if [ $? -ne 0 ]; then
+                rm -f ${guestname}.cfg
+                popd > /dev/null 2>&1
+                echo "Error in init script $f" >> ${LOGFILE} 2>&1
+                echo "${PREF} Error during pre init script of ${guestname}"
+                exit 1
+            fi
+        else
+            echo "$f is not executable. Skipping." >> ${LOGFILE}
         fi
     done
 
@@ -506,15 +514,20 @@ function xenguest_guest_start()
 
     # call init scripts
     for f in ${init_d}; do
-        echo "$f ${guestname}" >> ${LOGFILE} 2>&1
-        $f ${guestname} >> ${LOGFILE} 2>&1
-        if [ $? -ne 0 ]; then
-            rm -f ${guestname}.cfg
-            echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
-            xl destroy ${guestname} >> ${LOGFILE} 2>&1
-            popd > /dev/null 2>&1
-            echo "${PREF} Error during init script of ${guestname}"
-            exit 1
+        if [ -x "$f" ]; then
+            echo "( . $f )" >> ${LOGFILE} 2>&1
+            ( . $f ) >> ${LOGFILE} 2>&1
+            if [ $? -ne 0 ]; then
+                rm -f ${guestname}.cfg
+                echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
+                xl destroy ${guestname} >> ${LOGFILE} 2>&1
+                popd > /dev/null 2>&1
+                echo "Error in init script $f" >> ${LOGFILE} 2>&1
+                echo "${PREF} Error during init script of ${guestname}"
+                exit 1
+            fi
+        else
+            echo "$f is not executable. Skipping." >> ${LOGFILE}
         fi
     done
 
@@ -530,15 +543,20 @@ function xenguest_guest_start()
 
     # call post init scripts
     for f in ${init_post}; do
-        echo "$f ${guestname}" >> ${LOGFILE} 2>&1
-        $f ${guestname} >> ${LOGFILE} 2>&1
-        if [ $? -ne 0 ]; then
-            rm -f ${guestname}.cfg
-            echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
-            xl destroy ${guestname} >> ${LOGFILE} 2>&1
-            popd > /dev/null 2>&1
-            echo "${PREF} Error during post init script of ${guestname}"
-            exit 1
+        if [ -x "$f" ]; then
+            echo "( . $f )" >> ${LOGFILE} 2>&1
+            ( . $f ) >> ${LOGFILE} 2>&1
+            if [ $? -ne 0 ]; then
+                rm -f ${guestname}.cfg
+                echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
+                xl destroy ${guestname} >> ${LOGFILE} 2>&1
+                popd > /dev/null 2>&1
+                echo "Error in init script $f" >> ${LOGFILE} 2>&1
+                echo "${PREF} Error during post init script of ${guestname}"
+                exit 1
+            fi
+        else
+            echo "$f is not executable. Skipping." >> ${LOGFILE}
         fi
     done
 
-- 
2.7.4

