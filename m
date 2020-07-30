Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.55])
 by mx.groups.io with SMTP id smtpd.web11.11039.1596124350878080025
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 08:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PJOCA/AI;
 spf=pass (domain: arm.com, ip: 40.107.7.55, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pfo9obq904stBzzlE7r7z27zjXJih8w0BnoeBVJpUzA=;
 b=PJOCA/AIkFNRqxDTKdTwQw+7webvuhD/402ihkKrveCcefB6HDS6z8XVYrfSriJjE9v3hpD5ERxIG9Mx8+9sNjk/ewJJCL98ztWU1PPs8jK94PDwttjT7PaR1+a1Rmhco9QYcNVeS7Zr53ocmzTwbeggxd9mE3x22eE2lhnqu5Q=
Received: from DB6P195CA0020.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::30) by
 AM6PR08MB4423.eurprd08.prod.outlook.com (2603:10a6:20b:bf::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23; Thu, 30 Jul 2020 15:52:27 +0000
Received: from DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::f5) by DB6P195CA0020.outlook.office365.com
 (2603:10a6:4:cb::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Thu, 30 Jul 2020 15:52:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT056.mail.protection.outlook.com (10.152.21.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Thu, 30 Jul 2020 15:52:27 +0000
Received: ("Tessian outbound 1c27ecaec3d6:v62"); Thu, 30 Jul 2020 15:52:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 579a34e82f6f585c
X-CR-MTA-TID: 64aa7808
Received: from e31020da66d9.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A5D67946-B174-4AD8-9DB0-4C82ACD9FF73.1;
	Thu, 30 Jul 2020 15:52:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e31020da66d9.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Jul 2020 15:52:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUBvnvYQ97iOO4ftgQQXcD3Yf4G27ZJLBhUXVzOX21oIdFiAuZemr5oBVZn2Bf+8n4lh65GcqyOdADqnxfZsnA4vM7vzjWAeH4eBIiGZxqbBNNPRFxK3j1t3Kx5kCr+lYKioekJxgV9faxgwu9SIhFCQza9txddmnqKVTb2IDac698Yn0kGYp3FKWi+QWwUmpGlmfr5+c0cWyRoqGxGpSkANGt57s9Aem7R6vdpTDro1gekcqO5a7y+XOJG1fP7A3TNVAF/tB6JdZim93VYML0Oqu63+UxaveX1s2d6VEqresAO4H4ld2oV00cOVTctNFKLxsNO6P6xgNhA9ydMQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pfo9obq904stBzzlE7r7z27zjXJih8w0BnoeBVJpUzA=;
 b=Y0dRK0TyjmfOKDCvpCtm+Pjyd5h4aDIlECGfTBRUzrYOFHxHAU4LxA3ID+5SAF1CQcSEZDnOP/bzs0KhXqFGubh+dLGyTfS8cyB4g4OMFHLif0vFZ+tpT0cNKsDhwJt1Uz7K8g4g5rkD9QforGwuP6mhLf9o+i+AAC11fWOmeuX1JbTjXjH4wsrhXk8ImsJhZciYzxp9S18ECB2Khzx0i2TPQSYH5F8NRNzBICoHRF4PJg9TTNUyIjSFzTL+N3sJwGRmg6JIdLZHWanGtOqfYyvUBpQWpsxV1cDufM/1rdAHzXbCQWG2MDWGBSr4Tm1xQqqvUdcCXLqbHIEz2Frbkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pfo9obq904stBzzlE7r7z27zjXJih8w0BnoeBVJpUzA=;
 b=PJOCA/AIkFNRqxDTKdTwQw+7webvuhD/402ihkKrveCcefB6HDS6z8XVYrfSriJjE9v3hpD5ERxIG9Mx8+9sNjk/ewJJCL98ztWU1PPs8jK94PDwttjT7PaR1+a1Rmhco9QYcNVeS7Zr53ocmzTwbeggxd9mE3x22eE2lhnqu5Q=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB5425.eurprd08.prod.outlook.com (2603:10a6:208:17d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Thu, 30 Jul
 2020 15:52:20 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::b9b7:c928:1f9b:cb22]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::b9b7:c928:1f9b:cb22%5]) with mapi id 15.20.3239.017; Thu, 30 Jul 2020
 15:52:20 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/4] arm-autonomy/xenguest-network: Add NAT port forward support
Date: Thu, 30 Jul 2020 16:52:18 +0100
Message-Id: <1596124338-106961-4-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596124338-106961-1-git-send-email-diego.sueiro@arm.com>
References: <1596124338-106961-1-git-send-email-diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0261.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::33) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.54) by LO2P265CA0261.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8a::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3239.18 via Frontend Transport; Thu, 30 Jul 2020 15:52:20 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4cd4c6ad-4c22-47f7-19c3-08d834a08f0f
X-MS-TrafficTypeDiagnostic: AM0PR08MB5425:|AM6PR08MB4423:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB44233458BF343E17B25DEBD992710@AM6PR08MB4423.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 2S1Zluh6+VE1pVk+k3QsWNgU9PrBo8tqG/R9clT/Eyxm/P7tIBUdsY4ANyPKNHW+3Ul9aBVenTjXmbJ21OV1GdPe+adqCPHcBYwuvT9Oml2TH6oM75AL6Il2v8Lfspbf5Ci061MVTFOo149QOdBk4VywkY7IWs1ZVp1VRIZI8aomq9Iyqt74LnvgmAViCm5pbRn3JWo5KdVm4XNp8kKEDFA5QzxxN3Nuw7RKvdSKzCsYXC8CNUEydRWkZblejs2z5caXNhFQTfMZ8THb/dYKByxTDFp0FEBpl+UzvpsnpTamGSvmoDgitGUpDMkjXTbusw4HAhfFzclOM3hcy193wg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(66946007)(66556008)(2906002)(8676002)(316002)(478600001)(8936002)(956004)(16526019)(6486002)(26005)(2616005)(36756003)(186003)(66476007)(52116002)(83380400001)(6916009)(4326008)(5660300002)(44832011)(86362001)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 J0SgGB+sotd8bNYKbbCBQhNxGQBueWZz7GXgUaREQjVw0MiHjil2Gs1a2sHSrlsrmZ4/mpEioIy1HO6WMHprQwOgG6DPA50ppUkUWnthyv7IF0ABo8X1YNh4ovtZn+HJ/0GG4hfdgs0UbTWweu59B7CpHXH1iuBtsw41RxxOnFeWe9z0bVE5ouEcxk/Jqe8ibJYA7QZEu7wszSk/486hhrPv9NNKyYcx3WBAQevzYnC3fg59txm7RcdvJU9o22tpnaJ3BauC1WG/ZfK7NGiP2aW15fAy3MKThOeMIOi6Bc8PIrlZm0A0sLO0VWNmHUqUOmbxvsqFxXDV1U6lvL1c78SUlmWKZaCWfxvG5zOeFVX2gmE7LqHdPyNllMG3v4FGa/SLisvlxajiCQR2FdWmepreTf3+2lztfvBwFrbOCAE6dwuXeyjgxxq5cRjhND4JhzQItgEtrRg7uzdate81XKMu5os/Un/pbdEQPBv2HAlWgs/e9FyLT8Wwi97e9BR2uIjroS8MaCuZF6jmfT4dWCtZ0QtNoeicL3Hi3C570Z4JeDU6bt0qrYOZSvrbf1DSUuZjjcXhNIYMaVKzNZxB1dxzqEDGOI4cGbxip8jqsu7rORa4CiDd9W5BYdHMot0IU2+0MxnNgwBV4plxF7/Wtg==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5425
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	96f89b18-2631-40fd-3930-08d834a08b13
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IhHwoe/SFU5JUb4egSj40RewBw2YqJK/II3SWbtNk8ZvwI3oXJ+ZSNB0O+LjxZiOkpxnTbmTf3EXKEbCJGbECe8v+2uOpc6hZwlVCzldoD+nuFZWhYsCWHVBuftf9rmjCLMxT2uvIQSW11OSj5uQqdrXWfcPLfZZQV5CA1QZ6jwHIZuOvieH1pvYwqhNb93CLXsd9YjJml0FBt/7QxaonN1fJZhRbfXqMWH8NAyUyFVAPPDITtiYXhc9774polz/ZbTGAt/k7C711DNGEwu0obsbpazU8LRN9UeQLgcoRWXISd9xA5B7QQTx6v1rUsfck/Omn9Th/PNjHG3h/PIQ8Yvfro0JywmxyOFtLumLj9ckjm17fopIh1Uk8GAK83rg+O38ryODiZXuJzhgklmVbA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966005)(316002)(6916009)(2906002)(26005)(6486002)(5660300002)(36756003)(44832011)(478600001)(2616005)(186003)(16526019)(7696005)(4326008)(8676002)(70206006)(356005)(336012)(82740400003)(86362001)(956004)(8936002)(70586007)(83380400001)(82310400002)(81166007)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 15:52:27.2403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd4c6ad-4c22-47f7-19c3-08d834a08f0f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4423
Content-Type: text/plain

When XENGUEST_IMAGE_NETWORK_TYPE="nat", add the option to set NAT port
forward to have access to the guest from the external network.

The port forward is applied per guest by the 00-xenguest-nat-port-forward.hook
script which is called by /etc/xen/scripts/vif-post.d/00-vif-xenguest.hook.
The ports can be customised by the XENGUEST_IMAGE_HOST_PORT and
XENGUEST_IMAGE_GUEST_PORT variables.

Change-Id: I49492f5ac881fd3cc38838ce24d1d4160a4e65df
Issue-Id: SCM-1019
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../documentation/xenguest-network.md              |  6 +++
 .../xenguest/files/00-vif-xenguest.hook            | 16 ++++++++
 .../files/00-xenguest-nat-port-forward.hook        | 48 ++++++++++++++++++++++
 .../xenguest/xenguest-base-image.bb                | 28 ++++++++++++-
 .../recipes-extended/xenguest/xenguest-network.bb  |  1 +
 5 files changed, 97 insertions(+), 2 deletions(-)
 create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/00-xenguest-nat-port-forward.hook

diff --git a/meta-arm-autonomy/documentation/xenguest-network.md b/meta-arm-autonomy/documentation/xenguest-network.md
index c61a11a..b731f3e 100644
--- a/meta-arm-autonomy/documentation/xenguest-network.md
+++ b/meta-arm-autonomy/documentation/xenguest-network.md
@@ -66,5 +66,11 @@ The following parameters are available:
   image is created. It will be consumed by the
   "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" script which is called by
   "/etc/xen/scripts/vif-nat" script when starting/stopping the xenguest.
+  In the guest project, the NAT port forward can be customised by changing
+  the XENGUEST_IMAGE_HOST_PORT (default: "1000 + ${domid}") and
+  XENGUEST_IMAGE_GUEST_PORT (default: "22") variables in local.conf or
+  xenguest-base-image.bbappend. This configuration is implemented and installed
+  in "/etc/xenguest/guests/${guestname}/files/00-xenguest-nat-port-forward.hook"
+  script which is called by "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook".
   The **none** type will not affect any networking setting between on dom0 and
   domU.
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.hook b/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.hook
index 32d5976..7a2fb6f 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.hook
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.hook
@@ -95,6 +95,20 @@ dhcpd_offline(){
                                        # are no vifs.
 }
 
+call_extra_hooks() {
+    for f in /etc/xenguest/guests/${guestname}/files/*.hook; do
+        if [ -x "$f" ]; then
+            log info "Executing $f"
+            . "$f"
+            if [ $? -ne 0 ]; then
+                log err "$f failed."
+            fi
+        else
+            log info "$f is not executable. Skipping."
+        fi
+    done
+}
+
 case "${XENGUEST_NETWORK_TYPE}" in
     nat)
         XENGUEST_DHCPD_PARAMS_FILE=${XENGUEST_DHCPD_PARAMS_FILE:-"/etc/xenguest/guests/${guestname}/files/dhcpd-params.cfg"}
@@ -126,5 +140,7 @@ case "${XENGUEST_NETWORK_TYPE}" in
                ;;
         esac
 
+        # We might have extra configs to be applied (e.g.: NAT port forward).
+        call_extra_hooks
         ;;
 esac
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/00-xenguest-nat-port-forward.hook b/meta-arm-autonomy/recipes-extended/xenguest/files/00-xenguest-nat-port-forward.hook
new file mode 100755
index 0000000..875c181
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/00-xenguest-nat-port-forward.hook
@@ -0,0 +1,48 @@
+#============================================================================
+# /etc/xenguest/guests/${guestname}/files/00-xenguest-nat-port-forward.hook
+#
+# Script for performing local configuration related to NAT port forwarding of
+# a vif.
+# This script will be sourced by
+# /etc/xen/scripts/vif-post.d/00-vif-xenguest.hook when
+# XENGUEST_IMAGE_NETWORK_TYPE="nat".
+# The ${bridge} and ${domid} are set in the 00-vif-xenguest.hook context,
+# and ${vip_if} in the vif-nat script context.
+#
+# Environment vars:
+# command     (add|remove|online|offline)
+# dev         vif interface name (required).
+# main_ip     IP address of Dom0
+# ip          list of IP networks for the vif, space-separated
+# XENBUS_PATH path to this device's details in the XenStore (required).
+#============================================================================
+
+host_port="###HOST_PORT###"
+guest_port="###GUEST_PORT###"
+
+port_num_check() {
+    if [ ${host_port} -gt 65535 -o ${guest_port} -gt 65535 ]; then
+        log error "host_port=${host_port} or guest_port=${guest_port} greater than 65535."
+        return 1
+    fi
+    return 0
+}
+
+case "${command}" in
+    online)
+        port_num_check
+        if [ $? -eq 0 ]; then
+            iptables_w -t nat -A PREROUTING -i ${bridge} -p tcp \
+                       --dport ${host_port} -j DNAT \
+                       --to-destination ${vif_ip}:${guest_port} \
+                       -m comment --comment "dom${domid}"
+        fi
+        ;;
+    offline)
+        # Remove the NAT iptables rules created for the dom${domid}
+        guest_ipt_rule=$(iptables_w -t nat -vL PREROUTING -n --line-number \
+                         | grep -w dom${domid} | awk '{print $1}' | tac)
+        for rule in ${guest_ipt_rule}; \
+            do iptables_w -t nat --delete PREROUTING ${rule}; done
+        ;;
+esac
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
index 8516fe8..d164a81 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
@@ -23,6 +23,16 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
+# When XENGUEST_IMAGE_NETWORK_TYPE="nat", the "00-xenguest-nat-port-forward.hook"
+# is called by "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" to apply NAT
+# port forwarding. Both dom0 and domU ports can be be set by changing the
+# XENGUEST_IMAGE_HOST_PORT and XENGUEST_IMAGE_GUEST_PORT variables in local.conf
+# or xenguest-base-image.bbappend. The XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT
+# can also be replaced in a xenguest-base-image.bbappend
+XENGUEST_IMAGE_HOST_PORT ?= "\$( expr 1000 + \${domid} )"
+XENGUEST_IMAGE_GUEST_PORT ?= "22"
+XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT ?= "00-xenguest-nat-port-forward.hook"
+
 #
 # The following variables can contain SRC_URI compatible entries to add
 # files to the xenguest image.
@@ -40,7 +50,12 @@ XENGUEST_IMAGE_SRC_URI_DISK_FILES ??= ""
 # The dhcpd-params.cfg holds the dhcpd configuration for Dom0. And it is used
 # when XENGUEST_IMAGE_NETWORK_TYPE="nat". Any customizations to it should be
 # performed by replacing it via a xenguest-network.bbappend.
-XENGUEST_IMAGE_SRC_URI_XEN_FILES = "file://dhcpd-params.cfg"
+# The XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT file is only added if the
+# variable is set.
+XENGUEST_IMAGE_SRC_URI_XEN_FILES = "file://dhcpd-params.cfg \
+    ${@ "file://" + d.getVar('XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT') \
+      if d.getVar('XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT') else "" } \
+    "
 
 # Add xen configuration elements
 XENGUEST_IMAGE_SRC_URI_XEN_CONFIG ??= ""
@@ -82,8 +97,8 @@ python __anonymous() {
 
 # Make sure we are removing old files before redoing a fetch
 do_fetch[cleandirs] += "${WORKDIR}/extend"
+do_fetch[vardeps] += "XENGUEST_IMAGE_HOST_PORT XENGUEST_IMAGE_GUEST_PORT"
 
-do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 do_install[noexec] = "1"
 
@@ -107,6 +122,15 @@ add_extend_files() {
     fi
 }
 
+do_configure() {
+    if [ -f ${WORKDIR}/extend/files/${XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT} ]; then
+        sed -i "s,###HOST_PORT###,${XENGUEST_IMAGE_HOST_PORT}," \
+               ${WORKDIR}/extend/files/${XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT}
+        sed -i "s,###GUEST_PORT###,${XENGUEST_IMAGE_GUEST_PORT}," \
+               ${WORKDIR}/extend/files/${XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT}
+    fi
+}
+
 do_deploy() {
     # Create a new image
     xenguest_image_create
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
index fa4f93f..206a294 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
@@ -62,6 +62,7 @@ RDEPENDS_${PN} += "bridge-utils \
                    kernel-module-xt-tcpudp \
                    kernel-module-xt-physdev \
                    kernel-module-xt-comment \
+                   kernel-module-xt-nat \
                   "
 FILES_${PN} += "${sysconfdir}/network/interfaces.d/xenguest-network-bridge.cfg"
 FILES_${PN} += "${sysconfdir}/xenguest/init.pre/network-bridge.sh"
-- 
2.7.4

