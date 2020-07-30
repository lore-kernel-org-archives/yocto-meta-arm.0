Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.45])
 by mx.groups.io with SMTP id smtpd.web10.11180.1596124350182305912
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 08:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=O/m6aMxR;
 spf=pass (domain: arm.com, ip: 40.107.21.45, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEzqPRMRYYy2O19G9vDSnEC2/d1ILoFF8YjeqB/AqUc=;
 b=O/m6aMxR5NLNlZjZhm9LneMXKj795Q/vXIcdjRPuTiMDm8u6UK0WxHwxeuLCBUBXABEXG3keybNfOx0yHZ6Gf9/goV9Rpt29D+/4lYyHsLTpEYjdXJr5lvm3NYMS8iw3OfpBicff7eVHLZ6IHp4fPzdE0aydixItmi9hIBAxsIs=
Received: from AM5PR0701CA0014.eurprd07.prod.outlook.com
 (2603:10a6:203:51::24) by VE1PR08MB5199.eurprd08.prod.outlook.com
 (2603:10a6:803:10c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.28; Thu, 30 Jul
 2020 15:52:27 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::cb) by AM5PR0701CA0014.outlook.office365.com
 (2603:10a6:203:51::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.9 via Frontend
 Transport; Thu, 30 Jul 2020 15:52:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Thu, 30 Jul 2020 15:52:26 +0000
Received: ("Tessian outbound 8f45de5545d6:v62"); Thu, 30 Jul 2020 15:52:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 13c0cb0450f8842c
X-CR-MTA-TID: 64aa7808
Received: from c97a3733ccf7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C64602AE-0B84-4DB6-8880-2B24D38AD516.1;
	Thu, 30 Jul 2020 15:52:20 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c97a3733ccf7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Jul 2020 15:52:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bInGiYFHb26qH+4wh95jlew83y8P95LhnjaJPe69Tl+GMwQ+/lTF5gXWHogpYHlRWy4nmw0beuBAXl+dHr7MwzNQYC2QT7SKMTsp+0Vf42mtLMhy5Sd8TczqT0sxUhu2+H70VWYSN5Qcg08YxVVxS9thPIYh3OVpPLCh9q+lWRgUgDppzIVe4EGK72uX98i3fjeC/GHAT8IJB5nvrbkeSKwyXZKf84ZzN4KnBMAyQ/s6YD0SPtn0LYXnNUY9VKZnPS5lBRE401J5Rppp5ssUfn6Ew6y6Lgnv9iMRehgK54cPrMOm2vXdSzcqJKGHQnwiozLCVEcICKoSSALv2Wz4zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEzqPRMRYYy2O19G9vDSnEC2/d1ILoFF8YjeqB/AqUc=;
 b=d1NzblD4S332P3yHVrS/C/ubikF+fhcNf6DGqi6G3x+wzquog4v20BQ0BIxbcbij1cpiIAy+8nqzDxUy9Bas8q49mzWiOnnas6Cvcg9/6ACnlXxcx+Bkj1ZHr5iZGJyyKn/PZYG3T0wZFG4ofQ06qPIuQ9/H0QPWi9mYn/njD2fH/fA0ComEJYuvmUA0VFiDsDnGUlzeUlh+EgenJvVMSMfPigUk/HJPLN51X9nMjJl2aduPpTbxaij8WMuHk98XdUgRn7yhNzRugG8aGfXnqrDtgULo1hbXta1E4ENs3/dVECRMVQa3XjZxu4NTdMGj0dVKMmmIuEaBj3PLjYFwaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEzqPRMRYYy2O19G9vDSnEC2/d1ILoFF8YjeqB/AqUc=;
 b=O/m6aMxR5NLNlZjZhm9LneMXKj795Q/vXIcdjRPuTiMDm8u6UK0WxHwxeuLCBUBXABEXG3keybNfOx0yHZ6Gf9/goV9Rpt29D+/4lYyHsLTpEYjdXJr5lvm3NYMS8iw3OfpBicff7eVHLZ6IHp4fPzdE0aydixItmi9hIBAxsIs=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB5425.eurprd08.prod.outlook.com (2603:10a6:208:17d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Thu, 30 Jul
 2020 15:52:19 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::b9b7:c928:1f9b:cb22]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::b9b7:c928:1f9b:cb22%5]) with mapi id 15.20.3239.017; Thu, 30 Jul 2020
 15:52:19 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/4] arm-autonomy/xen-tools: vif-nat script fixes
Date: Thu, 30 Jul 2020 16:52:15 +0100
Message-Id: <1596124338-106961-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0261.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::33) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.54) by LO2P265CA0261.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8a::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3239.18 via Frontend Transport; Thu, 30 Jul 2020 15:52:19 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f4741e7c-7d26-4c83-0c24-08d834a08eee
X-MS-TrafficTypeDiagnostic: AM0PR08MB5425:|VE1PR08MB5199:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB519947C49FF52A7EB023609092710@VE1PR08MB5199.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 r0Y2765q/ynt7lVLqdt+5BCgxbHoXsxNPZxSlHY4lUMAeILgvFtJx6f4JNwQODYexypIzuYu0a2M3yk+rq5gzmMd3/e8EkBnCukS2WtgOPz7lnnOpZK+V+wrA6XA6Qt/IFifnck8mBpgOpy/uCqMXamu8oNtfSiGKd4a5rVY6FyHIBpSUPwXH7iGJJuj7tglyLaqbNAhrdpjIM+MHZQLht8mDUMCR3SyFGxBzZhqxtvaV9i0nwysxu6YNnhc+1WhwJBvedybRMFyw/OQC90KG6eCrelOVuTFG5ycBIt6IeVA5iRtFgGoiPVIGZUNRKVm
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(66946007)(66556008)(2906002)(8676002)(316002)(478600001)(8936002)(956004)(16526019)(6486002)(26005)(6666004)(2616005)(36756003)(186003)(66476007)(52116002)(6916009)(4326008)(5660300002)(44832011)(66574015)(86362001)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Ycagu0CqxWqUE+kugcnRpxysCyHbHjjMbVDiqAnB2HWqcz4XEJ80rd3YOPcwyaGYcHc2EosYhu6jZmLw+0HYM4mioO76tOKeQSfo24aUfy5VKdrRfRk7cQUNVS2Xr6QhPhwisaqaFjTUGPxVnVw8+/9dsGi/L36EYwqSf0KuukMs+9y6Wf0EeevkQQ/U5Mh/rlmWTHogOZmlq4t6FHxOGsVD1P5x83ZrLvBET0KIGfNhgiS0D2085h1SmxwpYOUgQvEhCOKppYBu7iAVk0wjFnmqXaIyC99pNGLI7WOPVJF3fCb0Rx0N4h2urFVLo5GM/l8IbZD4xiz4wbvQAfYpTJi+WQ7SY6ym5wWplirC351+4zNvnkrtNXKNhlsmJREyeMCR2BQQJC2rmg84tckgyovgT18WAqVOE5jVPH9LHjq0ykIFOsE1rambqTxRnwjTRZ0B8wpjDHm/Lv3RYSpvGMtULHIvwO8SwJYzrdV5ARrnqVP0pgm0PcsacIrBPccVCxakyjZW2hmAgKQJ5QFc7UPAMH8/wRMjMA9mut5lfzyDOdiFalrwk/hdy3TZiqV1D9XF+gt2jgHyiyFIfV+ZomyNTFamLwARyYoxEyqcNSU5XP/bKa4AcY5ets8MUGPkO2kaXPpq6/0W1lI3nlX3mw==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5425
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	42533b3d-c4bc-4dfb-f397-08d834a08a57
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZKtz182sFfHmK+548dtQjgt4Ko2VbRgcjr4t39lwTZk4sRhm32Cpt2sDCeIZNE6gcpYTF3ye/tDe+5MtN16CvKUYX21Rql7iFXHbLLflwnioCC9h1sNRHXoGSiIUYHHzXZpoIhnUH/HEVr8t3OlEIjbsf819hT3x69FzbRUyw6IytcgfrfnKwS+cdhmur8/I2HxcPM0Bh/C2foj77PMqnTyXlp4J6VUTCBbI5RO80ycfDuwVvLkKDFP1xhRhadqza8HQiU3oCM9tNtFj/k5LFjvbj73xk9/U35GctrqiDEwvzPcYcq7o0DioQsZFzGUdF58A/wCjNKiX0Fyhl6YywrGW7Pxt1fbfz6VKPegPU4IxIuQMHI29ZHFkAOzMIEsxHxFmSHC8W65G+qg4Aap1tg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(46966005)(36756003)(8676002)(336012)(6486002)(7696005)(66574015)(5660300002)(2906002)(47076004)(8936002)(70586007)(6666004)(16526019)(82740400003)(81166007)(70206006)(82310400002)(186003)(316002)(44832011)(478600001)(4326008)(956004)(36906005)(86362001)(6916009)(26005)(356005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 15:52:26.9712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4741e7c-7d26-4c83-0c24-08d834a08eee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5199
Content-Type: text/plain

This patch introduces two fixes for the vif-nat script:
1- Setting the hostname is failing because the "$XENBUS_PATH/domain"
   doesn't exist anymore. To fix this we set it to dom$domid.
2- Copy temp files used to add/remove dhcpd configurations to avoid
   replacing potential symlinks.

Change-Id: I5f2ed917c15bbe1c6ff9ec3cc9ad2fc4e1c0fb60
Issue-Id: SCM-1019
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../xen/xen-tools/0001-vif-nat-fix-hostname.patch  | 18 +++++++++
 .../0002-vif-nat-fix-symlink-removal.patch         | 45 ++++++++++++++++++++++
 .../recipes-extended/xen/xen-tools_%.bbappend      |  5 +++
 3 files changed, 68 insertions(+)
 create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-nat-fix-hostname.patch
 create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-tools/0002-vif-nat-fix-symlink-removal.patch
 create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend

diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-nat-fix-hostname.patch b/meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-nat-fix-hostname.patch
new file mode 100644
index 0000000..87f25e2
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-nat-fix-hostname.patch
@@ -0,0 +1,18 @@
+Upstream-Status: Pending
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+
+Setting the hostname is failing because the "$XENBUS_PATH/domain"
+doesn't exist anymore. To fix this we set it to dom$domid
+
+Index: git/tools/hotplug/Linux/vif-nat
+===================================================================
+--- git.orig/tools/hotplug/Linux/vif-nat
++++ git/tools/hotplug/Linux/vif-nat
+@@ -86,6 +86,7 @@ router_ip=$(routing_ip "$ip")
+ vif_ip=`echo ${ip} | awk -F/ '{print $1}'`
+ 
+ hostname=$(xenstore_read "$XENBUS_PATH/domain" | tr -- '_.:/+' '-----')
++[ -z "${hostname}" ] && hostname=dom$domid
+ if [ "$vifid" != "1" ]
+ then
+   hostname="$hostname-$vifid"
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools/0002-vif-nat-fix-symlink-removal.patch b/meta-arm-autonomy/recipes-extended/xen/xen-tools/0002-vif-nat-fix-symlink-removal.patch
new file mode 100644
index 0000000..bcd5778
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools/0002-vif-nat-fix-symlink-removal.patch
@@ -0,0 +1,45 @@
+Upstream-Status: Pending
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+
+Copy temp files used to add/remove dhcpd configurations to avoid
+replacing potential symlinks.
+
+Index: git/tools/hotplug/Linux/vif-nat
+===================================================================
+--- git.orig/tools/hotplug/Linux/vif-nat
++++ git/tools/hotplug/Linux/vif-nat
+@@ -99,7 +100,8 @@ dhcparg_remove_entry()
+   then
+     rm "$tmpfile"
+   else
+-    mv "$tmpfile" "$dhcpd_arg_file"
++    cp "$tmpfile" "$dhcpd_arg_file"
++    rm "$tmpfile"
+   fi
+ }
+ 
+@@ -109,11 +111,11 @@ dhcparg_add_entry()
+   local tmpfile=$(mktemp)
+   # handle Red Hat, SUSE, and Debian styles, with or without quotes
+   sed -e 's/^DHCPDARGS="*\([^"]*\)"*/DHCPDARGS="\1'"${dev} "'"/' \
+-     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
++     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
+   sed -e 's/^DHCPD_INTERFACE="*\([^"]*\)"*/DHCPD_INTERFACE="\1'"${dev} "'"/' \
+-     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
++     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
+   sed -e 's/^INTERFACES="*\([^"]*\)"*/INTERFACES="\1'"${dev} "'"/' \
+-     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
++     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
+   rm -f "$tmpfile"
+ }
+ 
+@@ -125,7 +127,8 @@ dhcp_remove_entry()
+   then
+     rm "$tmpfile"
+   else
+-    mv "$tmpfile" "$dhcpd_conf_file"
++    cp "$tmpfile" "$dhcpd_conf_file"
++    rm "$tmpfile"
+   fi
+   dhcparg_remove_entry
+ }
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
new file mode 100644
index 0000000..ef8eddd
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://0001-vif-nat-fix-hostname.patch \
+            file://0002-vif-nat-fix-symlink-removal.patch \
+           "
-- 
2.7.4

