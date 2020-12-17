Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.45])
 by mx.groups.io with SMTP id smtpd.web08.11494.1608223887630496926
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 08:51:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=5ZWCsTSY;
 spf=pass (domain: arm.com, ip: 40.107.7.45, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TsRoAfL/ydlgtJjQQDmlvtf+5GhDX6z7dW1ietqFs4=;
 b=5ZWCsTSYUbwTshfo/NNNfmCurMAgecARh20DpX1J/o9uZM9goH31nR6FYf5sp9f74VmbVfQZntHpVLWKCAZeJoUEwEkTja/wGUS/SbdEWTtrx/pCjHj7LTyp2rpNFSXmjoBZuYKb5bwhWo+hqLsGyYmHnvRKW6e68Y5HxVwzmrQ=
Received: from DB8PR03CA0019.eurprd03.prod.outlook.com (2603:10a6:10:be::32)
 by VI1PR08MB2703.eurprd08.prod.outlook.com (2603:10a6:802:25::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Thu, 17 Dec
 2020 16:51:23 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::b4) by DB8PR03CA0019.outlook.office365.com
 (2603:10a6:10:be::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 17 Dec 2020 16:51:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.22 via Frontend Transport; Thu, 17 Dec 2020 16:51:21 +0000
Received: ("Tessian outbound 6ec21dac9dd3:v71"); Thu, 17 Dec 2020 16:51:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: da31d1233612189e
X-CR-MTA-TID: 64aa7808
Received: from 132ab6fe8395.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3F52AB78-C49F-4AED-95F5-69563E28D850.1;
	Thu, 17 Dec 2020 16:51:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 132ab6fe8395.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 17 Dec 2020 16:51:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5MZnhlgvBP4ZhJGfe4M53wnG/ORsa2cBqqlxHxCJDwv3jfcQffAaa2lxy/fzrasVawHUhLTwu2aUcOKhJntJPwfGAQW5P4oAiPxCpFPk2YSy5jHdDeG6ApnXiCU3WvpLI1Kbe+hd6YkabjBUdrASrK8xNVN/kaI2gIx8/uIsvtdLKhBWXu9XLafVz45yA8RxHHbPLEoknK5w2WAVph2Iw2uGjuzx40vm+zLAm7olDz70uUX1bBhjXpC5Txc7/X3yE++jUcSQ5gv/u02xlFCnrSPei5QmvEt9hTJjsRTSzVyr75NSVditruwUU/Ih/QQ2AWDf9KI412Z0tkx0oaAyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TsRoAfL/ydlgtJjQQDmlvtf+5GhDX6z7dW1ietqFs4=;
 b=IZgY3NE8siN2Vtyy8ijjSMDZx7dpFFuFeNodRRBkuLMBoR7WosPlg8HvA9zEDIxAuisdIoBM5jsMPvi3dmWpEbp6TTh+p6iFqfMoIMk/VHcFa9cC3UTfVWb1ww+5q7brVJOKPX5D+2nH9JUG4DKK78J0PVAnr4UkBbexFul/n6O9WP/AM+THEq31idCMtgbKtIk9zRNdJWDBtlZN4H1k4eJFEBcE3HtfciJnGIOhtYbwgJP1jVTFMscbVOYPh3V5HJK1vEL/9QiTBFtuJtwBv5CJUjmmacuvYtZ8KxXqGGFsBPrW9WeQZ5EyCLoHRvxqKD8+d5wZHEHicOn5k91wJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TsRoAfL/ydlgtJjQQDmlvtf+5GhDX6z7dW1ietqFs4=;
 b=5ZWCsTSYUbwTshfo/NNNfmCurMAgecARh20DpX1J/o9uZM9goH31nR6FYf5sp9f74VmbVfQZntHpVLWKCAZeJoUEwEkTja/wGUS/SbdEWTtrx/pCjHj7LTyp2rpNFSXmjoBZuYKb5bwhWo+hqLsGyYmHnvRKW6e68Y5HxVwzmrQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6167.eurprd08.prod.outlook.com (2603:10a6:20b:298::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Thu, 17 Dec
 2020 16:51:05 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%5]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 16:51:05 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH] arm-autonomy/xenguest-manager: Clean up code duplication
Date: Thu, 17 Dec 2020 16:50:58 +0000
Message-Id: <cb06adf285d6f5b0ceaeec667f7f85f034be78c7.1608223753.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.55]
X-ClientProxiedBy: LO4P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::6) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.55) by LO4P123CA0091.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Thu, 17 Dec 2020 16:51:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 996e55f0-4435-45da-6ef1-08d8a2abfbbc
X-MS-TrafficTypeDiagnostic: AS8PR08MB6167:|VI1PR08MB2703:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB2703E6A14EB572BA9E1D457F92C40@VI1PR08MB2703.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1ojZP0zUUBihOWQ8i+ozF1T6aQa4hFg8f+B8s6b6gYhjnXA/l9n9fBdz55zBvgJ7eQCTVin1JGONyUKsHUL09PXrRFAC8W/Dj60uiYTIcfv8yjwweGaa6WDgJ/Kt/rG0fOjA6PuCzixsXlDkQ85wzKYR7fietU/0uV3qjCBLREj9IqAAI+WSIbUFtd55ZSZCcE38XRUoPUjip1bDUIP+E973GDkILv79/N/t4Y+sVU0N/uOi3Dl7sx7e4gSLz1bR1fj4uuUNe7nTkI+wIyQMAVpOnBU2NuR1jEpdzrewfS4EZhZKHER0nHi7B/CFFgjRb0JU+xjw2qozOQAS9U5ITNB9KZkUpD7sC8MRnOLN//AHF4HufZVFj1dqXrvXzXCCXodDQytJaMX9sN/P+vBXYA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(86362001)(478600001)(36756003)(44832011)(2906002)(6916009)(16526019)(956004)(2616005)(186003)(6486002)(8676002)(7696005)(52116002)(26005)(316002)(83380400001)(4326008)(5660300002)(66476007)(66556008)(66946007)(6666004)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?5zIHRYR2sCCpbqD1pTSxNe5QXJoScmmKdD8UyhIbBox/YnpHhZ/STY7r5CDz?=
 =?us-ascii?Q?pOuvt1eH3g60eTWB4J5DbeLT8GtDatDxjm21K8oPQ6dx3fMv00cPiwOmsJH8?=
 =?us-ascii?Q?evUtMOD/9XmYQTpQHYziIEzCPyvagHQUp51gQMDCEUBLnywrM4hzSBx3IXTV?=
 =?us-ascii?Q?QMDeYpWQvCWSNBfGxMQRl3L8kOZaD3nfrzdf5A2fKIKWwt+ncZTWD5ojw76r?=
 =?us-ascii?Q?76Pep/VL+bZaEOCXTc5ltjZvFcLrY294OHT+hsuVmAueRBa7rqDZK1rlgyg8?=
 =?us-ascii?Q?83/JPBmVQKHGWHK1qP+8lq83Rh/zFAgY6BiUF84+Uo6JS2YmuGqBjtI74YKg?=
 =?us-ascii?Q?Vpc40uoE5Bnv45eAIZ2obAiuXLaXG+GTmVHaDpW9a8ghKs1Uo+8Ml+AMyqaQ?=
 =?us-ascii?Q?TEOCZC9o7dpPUj+x7y2lurf3KI4J0Pu1GdFYckXCbvbO+lmBryjAHxNOJ/dE?=
 =?us-ascii?Q?LeU4X420w7rpJfVNKqmm+ix73XxoROLfJLR8wZl+T6/uCMIwcdkY16opnV6A?=
 =?us-ascii?Q?WqDyiNT3z4IqnUh7g9dGUDhtel5fPMbnWMsp+yIx8Fsornytknv9ir7GP26e?=
 =?us-ascii?Q?hnLBpXUj8g2TeEIZZs6qvcPAADR8mqYfUun/6XVNCF4nkaMAlHg6nQs4t6ZG?=
 =?us-ascii?Q?R2NV2jzM4s2ZTkefbw79bxVMcTrG6hKGUF7LAVQIYiMkf+goHcaCbnIm6Np8?=
 =?us-ascii?Q?ZNdfPt5twryMjZZi5EwpgzLdKTXyTE4QGdNlWatIbPExl9WpmW8iAleTKOpt?=
 =?us-ascii?Q?Du2vOt94bmuIzbITh+z38bKyQwFGAp1y3sR1qgBp5lpoBP9Z77uraY22rwJK?=
 =?us-ascii?Q?3oXWEdvK+H5x8xYMDxMxx3G2/jKB0RaXvANr8NR78HDUyhJ/M/WIZSVSYk0s?=
 =?us-ascii?Q?BGApiA1rdRiBQw2144XGtVotg9Sdjj5TUWqd1+2yShplMQgxPeNvTpzzJ8jK?=
 =?us-ascii?Q?9DChtoZeP7qvLkoie3fP9+RuFsSSAmsqBe54A+p7o2wc6rKpLLL26i/e1N2s?=
 =?us-ascii?Q?HcC3?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6167
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d6f951a9-52e5-464b-e93b-08d8a2abf1d0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cQ+REcaUf5LAXn1AZdKXd5J+WXO6PwCfJ8rqFahu0Qdw81Qjs/qkQn8tHZVTwbIP/36xhav5eFz6UKPJTsQNu2tzJeeMnUuCThZL5TSuiEyM4Ve6phZx3hA9EkWJUXgBgjp9UPKMuEJo14Oyb8a7Tzd1m5crBeKVc+lU4/4H+9qgz2BzJPcIlPo7TxmoCmFyeeEOuHHvW73Z1HZAwDEZteuJyuyAAu8hdf15R0aFJtIu5RC+yj6/uvfoPe1OMdEiOu1IIHMTDCkguWPSGRtEPA76HYjDS4n161JrqJoVElORxyNY+odis8RHH0Xc6z5IWdLFaRDXOv6ZRRhc1llknKKtHr8B+eHsfb7rWJgwdhzxJ/cYOvoD3f0JpwSu67Ry7XvObZJ6jTBum7Sv2po8yA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966005)(6916009)(81166007)(8936002)(336012)(36756003)(356005)(4326008)(478600001)(956004)(186003)(70206006)(83380400001)(316002)(16526019)(2906002)(70586007)(82740400003)(47076004)(26005)(44832011)(6666004)(7696005)(2616005)(5660300002)(8676002)(6486002)(82310400003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 16:51:21.9382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 996e55f0-4435-45da-6ef1-08d8a2abfbbc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2703
Content-Type: text/plain

From: Nathan Dunne <Nathan.Dunne@arm.com>

Reduced duplicated code in xenguest-manager to functions for better
maintainability. Also reduced instances of calling self with a different
argument, which is better for performance and log readability.

Issue-Id: SCM-1635
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: Ic37b6b0a8a5f38145a298cc6aab908e3e58ae313
---
 .../xenguest/files/xenguest-manager           | 216 ++++++++++--------
 1 file changed, 127 insertions(+), 89 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
index b90cc73..8a54806 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -354,6 +354,39 @@ function xenguest_detach_disk()
     log verbose "Partition '${part}' detached successfully"
 }
 
+#Private
+function xenguest_volume_remove()
+{
+    # Inputs:
+    # $1 - volumename
+    # $2 - guestname
+
+    local volumename
+    local guestname
+
+    volumename="${1}"
+    guestname="${2}"
+
+    devname="/dev/${volumename}/${guestname}"
+
+    # Remove volume if it exists
+    log verbose "Checking for volume ${devname}"
+    log_command verbose "lvs ${volumename}/${guestname}"
+    if [ $? -eq 0 ]; then
+        log info "Removing volume ${devname}"
+        log_command "lvremove -y ${devname}"
+        if [ $? -ne 0 ]; then
+            log error "Removing volume ${devname} failed."
+            return 1
+        else
+            log verbose "Volume ${devname} removed successfully"
+            return 0
+        fi
+    fi
+
+    log verbose "Volume ${devname} not found"
+}
+
 # Private
 function xenguest_disk_init()
 {
@@ -407,14 +440,9 @@ function xenguest_disk_init()
     log info "Creating hard drive for guest '${guestname}'. This might take a while..."
 
     # Remove volume if it already exist
-    log_command verbose "lvs ${volumename}/${guestname}"
-    if [ $? -eq 0 ]; then
-        log info "Removing existing volume ${devname}"
-        log_command "lvremove -y ${devname}"
-        if [ $? -ne 0 ]; then
-            log error "Removing existing volume ${devname} failed."
-            return 1
-        fi
+    xenguest_volume_remove ${volumename} ${guestname}
+    if [ $? -ne 0 ]; then
+        return 1
     fi
 
     # Create volume
@@ -719,24 +747,63 @@ function xenguest_guest_remove()
     fi
     devname="/dev/${volumename}/${guestname}"
 
-    # check if guest had a volume
-    log verbose "Checking if ${guestname} has a volume to remove"
-    log_command verbose "lvs ${volumename}/${guestname}"
-    if [ $? -eq 0 ]; then
-        # Remove guest volume
-        log info "Removing volume ${devname}. This might take a while..."
-        log_command "lvremove -y \"${devname}\""
-        if [ $? -ne 0 ]; then
-            log error "Removing volume ${devname} failed."
-            exit 1
-        fi
-    fi
+    # find and remove guest volume
+    xenguest_volume_remove ${volumename} ${guestname}
+    status=$?
 
     # remove guest files
     log info "Removing configuration files for guest '${guestname}'."
     log_command "rm -rf ${XENGUEST_CONF_BASE}/guests/${guestname}"
 
-    log info "Removed guest '${guestname}' succesfully"
+    if [ ${status} -ne 0 ]; then
+        # Shouldn't log success message if volume removal fails
+        exit 1
+    fi
+
+    log info "Removed guest '${guestname}' successfully"
+}
+
+# Private
+function xenguest_call_inits()
+{
+    # Inputs:
+    # $1 - script directory
+
+    local scriptdir
+    local guestdir
+    local guestcfgfile
+    local guestname
+
+    scriptdir="${1}"
+    guestdir="${2}"
+    guestcfgfile="${3}"
+    guestname="${4}"
+
+    log "Attempting to call all init scripts in ${scriptdir}"
+
+    check_private
+
+
+    init_scripts="$(find ${XENGUEST_CONF_BASE}/${scriptdir} -type f 2> /dev/null | \
+            sort) $(find ${guestdir}/${scriptdir} -type f 2> /dev/null | sort)"
+    for f in ${init_scripts}; do
+        if [ -x "$f" ]; then
+            log_source $f
+            if [ $? -ne 0 ]; then
+                rm -f ${guestcfgfile}
+                popd > /dev/null 2>&1
+                log fatal "Error during init script $(basename $f) of ${guestname}"
+            fi
+        else
+            log fatal "$f is not executable. Exiting..."
+        fi
+    done
+
+    if [ "${init_scripts}" = " " ]; then
+        log "No scripts found"
+    else
+        log "All init scripts in ${scriptdir} completed successfully"
+    fi
 }
 
 # Private
@@ -764,27 +831,12 @@ function xenguest_guest_start()
     #
     # These scripts are sourced throughout the start operation if they
     # are executable
-    init_pre="$(find ${XENGUEST_CONF_BASE}/init.pre -type f 2> /dev/null | \
-            sort) $(find ${guestdir}/init.pre -type f 2> /dev/null | sort)"
-    init_d="$(find ${XENGUEST_CONF_BASE}/init.d -type f 2> /dev/null | \
-            sort) $(find ${guestdir}/init.d -type f 2> /dev/null | sort)"
-    init_post="$(find ${XENGUEST_CONF_BASE}/init.post -type f 2> /dev/null | \
-            sort) $(find ${guestdir}/init.post -type f 2> /dev/null | sort)"
+    init_pre="init.pre"
+    init_d="init.d"
+    init_post="init.post"
 
     # call pre init scripts
-    log verbose "Calling pre-init scripts"
-    for f in ${init_pre}; do
-        if [ -x "$f" ]; then
-            log_source $f
-            if [ $? -ne 0 ]; then
-                rm -f ${guestcfgfile}
-                popd > /dev/null 2>&1
-                log fatal "Pre-init script $(basename $f) of ${guestname} returned non-zero status"
-            fi
-        else
-            log fatal "$f is not executable. Exiting..."
-        fi
-    done
+    xenguest_call_inits "${init_pre}" "${guestdir}" "${guestcfgfile}" "${guestname}"
 
     # Create non started guest
     log verbose "Initiating ${guestname}"
@@ -796,20 +848,7 @@ function xenguest_guest_start()
     fi
 
     # call init scripts
-    log verbose "Calling init scripts"
-    for f in ${init_d}; do
-        if [ -x "$f" ]; then
-            log_source $f
-            if [ $? -ne 0 ]; then
-                rm -f ${guestcfgfile}
-                log_command "xl destroy ${guestname}"
-                popd > /dev/null 2>&1
-                log fatal "Init script $(basename $f) of ${guestname} returned non-zero status"
-            fi
-        else
-            log fatal "$f is not executable. Exiting..."
-        fi
-    done
+    xenguest_call_inits "${init_d}" "${guestdir}" "${guestcfgfile}" "${guestname}"
 
     # Start guest
     log info "Starting ${guestname}"
@@ -821,20 +860,7 @@ function xenguest_guest_start()
     fi
 
     # call post init scripts
-    log verbose "Calling post-init scripts"
-    for f in ${init_post}; do
-        if [ -x "$f" ]; then
-            log_source $f
-            if [ $? -ne 0 ]; then
-                rm -f ${guestcfgfile}
-                log_command "xl destroy ${guestname}"
-                popd > /dev/null 2>&1
-                log fatal "Post-init script $(basename $f) of ${guestname} returned non-zero status"
-            fi
-        else
-            log fatal "$f is not executable. Exiting..."
-        fi
-    done
+    xenguest_call_inits "${init_post}" "${guestdir}" "${guestcfgfile}" "${guestname}"
 
     rm -f ${guestcfgfile}
     popd > /dev/null 2>&1
@@ -858,6 +884,23 @@ function xenguest_guest_stop()
     echo "Guest '${guestname}' may not have stopped yet. Use 'status' to check"
 }
 
+# Private
+function xenguest_guest_kill()
+{
+    local guestname
+
+    guestname="${1}"
+    log "Attempting to kill guest '${guestname}'"
+
+    check_private
+
+    log_command "xl destroy ${guestname}"
+    if [ $? -ne 0 ]; then
+        log "fatal:Killing guest '${guestname}' failed."
+    fi
+    log "Guest '${guestname}' killed successfully"
+}
+
 # Private
 function check_guest_arg()
 {
@@ -882,6 +925,17 @@ function check_guest_exist()
     log verbose "Guest '${guestname}' found: ${XENGUEST_CONF_BASE}/guests/${guestname}/"
 }
 
+# Public
+function xenguest_list_guests()
+{
+    guestlist=""
+    if [ -d ${XENGUEST_CONF_BASE}/guests ]; then
+        guestlist=$(find ${XENGUEST_CONF_BASE}/guests -mindepth 1 -maxdepth 1 -type d -exec sh -c 'if [ -f {}/guest.cfg ]; then basename {}; fi' \;)
+    else
+        log "Info: Guests directory ${XENGUEST_CONF_BASE}/guests not found"
+    fi
+}
+
 # Public
 function xl_list_contains()
 {
@@ -981,14 +1035,9 @@ case ${cmd} in
         guestname="${arg1:-}"
         check_guest_arg ${cmd} ${guestname}
         check_guest_exist ${guestname}
-        log info "Guest '${guestname}' exists. Removing"
         # We need to stop the guest first if it is running
         if xl_list_contains $guestname; then
-            log info "Guest '${guestname}' is running. Killing..."
-            log_command "xl destroy ${guestname}"
-            if [ $? -ne 0 ]; then
-                log fatal "Killing guest '${guestname}' failed."
-            fi
+            xenguest_guest_kill ${guestname}
         fi
         xenguest_guest_remove ${guestname}
         ;;
@@ -1011,22 +1060,11 @@ case ${cmd} in
         check_guest_arg ${cmd} ${guestname}
         check_guest_exist ${guestname}
         check_guest_running ${guestname}
-        log info "Attempting to kill guest '${guestname}'"
-        log_command "xl destroy ${guestname}"
-        if [ $? -ne 0 ]; then
-            log fatal "Killing guest '${guestname}' failed."
-        fi
-        log info "Guest '${guestname}' killed successfully"
+        xenguest_guest_kill ${guestname}
         ;;
     list)
-        if [ -d ${XENGUEST_CONF_BASE}/guests ]; then
-            list=$(find ${XENGUEST_CONF_BASE}/guests -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)
-            for f in ${list}; do
-                if [ -f ${XENGUEST_CONF_BASE}/guests/$f/guest.cfg ]; then
-                    echo "$f"
-                fi
-            done
-        fi
+        xenguest_list_guests
+        echo ${guestlist} | tr " " "\n"
         ;;
     status)
 
@@ -1044,7 +1082,7 @@ case ${cmd} in
         if [ -n "${guestname}" ]; then
             single_status ${guestname}
         else
-            guestlist=$($this list)
+            xenguest_list_guests
             if [ -n "${guestlist}" ]; then
                 for f in ${guestlist}; do
                     single_status $f
-- 
2.17.1

