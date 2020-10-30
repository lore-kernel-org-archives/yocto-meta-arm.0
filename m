Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.70])
 by mx.groups.io with SMTP id smtpd.web09.11412.1604052274345819311
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 03:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OSTnRS5G;
 spf=pass (domain: arm.com, ip: 40.107.13.70, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+JyqnVuMdwRZxCWyIR1tvaH6ECG7YxoQeo7saeYS9A=;
 b=OSTnRS5GaVYHYcBq58r3qI/hpapARpkOYodYHiYp3sRjlEFBvDVYMVkgax0bmpBKCSLxgBA3CCHJu+TvVr7i/18iQdY6sAEqMzSbUeerC87aJ3TpkXYVMSGRojZDGy7zgYJ7cTpv6iVCB3qsoISSuoR5lqTJsx6LvkTcvQuJkdY=
Received: from AM5PR0301CA0025.eurprd03.prod.outlook.com
 (2603:10a6:206:14::38) by VI1PR0802MB2591.eurprd08.prod.outlook.com
 (2603:10a6:800:bb::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 10:04:26 +0000
Received: from AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::1c) by AM5PR0301CA0025.outlook.office365.com
 (2603:10a6:206:14::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 30 Oct 2020 10:04:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT049.mail.protection.outlook.com (10.152.17.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 10:04:26 +0000
Received: ("Tessian outbound 68da730eaaba:v64"); Fri, 30 Oct 2020 10:04:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: be22a00dd183da0b
X-CR-MTA-TID: 64aa7808
Received: from e5402cf5671e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F1D53AB8-7129-4D7E-9D12-694BFAA956D0.1;
	Fri, 30 Oct 2020 10:03:47 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e5402cf5671e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 30 Oct 2020 10:03:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqEJXAXJHZb8TiiBXfxvKDYzflUoSLMvHmiYm5GZb+vRR66HBrwv2wfw0P2j4I5AT6TPwyLOgJ8+ApwXNB23IhKJu1BflhgG7n/JppIbgJIkBlEsRgLvb76/fTPV7c7lYJc0O16Pm5EpxRaPMQyWu248YrhiYQbGOrIpfrugwxzUEXKOlHmJfkhPM2Hb7P/l2kjYP1+kmk52Jqq291BTDlrwXbpPiRGcb9kwJ9KzWRuslwPY3HBsRzDbMTA08myeBbHNrN8ztGT1ho4Dhorpt5R3DKUJG3OYKgvsJp0Y4pQLI3rDZekOaWam93UkIaiBh4a4VQzLR+sgIL3S83abjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+JyqnVuMdwRZxCWyIR1tvaH6ECG7YxoQeo7saeYS9A=;
 b=TVQYjGK3jWSimgx2USAwXMPiNHbd8uTrQ02OpR9pXJLAmt2RCfcBwZdfk3qz05RaA4hO7IYUnNecWZeMupnuEcJ8JgVcQF78qaMhSyOJzY51Fj2vxUFKjOEbtsagtdQGGo2E8mo2pXXwckqM8QHz0Jm3Ntl2N3B38HQ+B7H8jDL5Jl0OirX5sSEopEep4BcV5CEAZJvTDzIFJBS9PV7KiczNm2MknUrjVGBanes8YzmmVrUndYLui/0e29u8QYKyf7JBN3GQ42VLSGXVfZtNDYaAb9+JFdd/X/qu5GKjJXAYl/J8KWeVmsiO9IYQ6cl7hKodNOboJ0T+ADnmq7iJzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+JyqnVuMdwRZxCWyIR1tvaH6ECG7YxoQeo7saeYS9A=;
 b=OSTnRS5GaVYHYcBq58r3qI/hpapARpkOYodYHiYp3sRjlEFBvDVYMVkgax0bmpBKCSLxgBA3CCHJu+TvVr7i/18iQdY6sAEqMzSbUeerC87aJ3TpkXYVMSGRojZDGy7zgYJ7cTpv6iVCB3qsoISSuoR5lqTJsx6LvkTcvQuJkdY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM7PR08MB5525.eurprd08.prod.outlook.com (2603:10a6:20b:107::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.28; Fri, 30 Oct
 2020 10:03:46 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3499.028; Fri, 30 Oct 2020
 10:03:46 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH] arm-autonomy/xenguest-manager: Allow guests with substring names
Date: Fri, 30 Oct 2020 10:03:38 +0000
Message-Id: <20201030100338.2159-1-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.54]
X-ClientProxiedBy: LNXP265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::26) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-dievar01.stack04.eu02.mi.arm.com (217.140.106.54) by LNXP265CA0086.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:76::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Fri, 30 Oct 2020 10:03:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 04b23609-0f44-429b-daa5-08d87cbb2f23
X-MS-TrafficTypeDiagnostic: AM7PR08MB5525:|VI1PR0802MB2591:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB25915D46A611F3762E59929A92150@VI1PR0802MB2591.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 n2axH+iKr8rmj1cwTLV2Z31L36q67xA60PEFrtYaSRECLWU46L3Qp+w71QOHb4ApyZArfBX1VQTAGXZFoMj3k6GyfR/e4gF2tWfd3Z7XHIrMhSBuBKPCznQrCDH/L02Y3HInWzHDvsRjPeU5JI+ZRwS3hGAAkH8WNkWLkUPYZJ8PvrqfbtvCkC+PeOoadGeS4HXz6nBte6zM1htZoRzsSh1zL1l1fzR9Oqyc6lNMgIAZYAyxHm5L0yBEWVjpVzRCAbmDFD/AEkXG+NvO2xu8zN++mkTIi9RZaL3pBiUpbZ2dJ4oLBRJ/H9ENoBLcn4aXOAzZf2MrLC19WrLRaYxr1w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(39850400004)(136003)(6666004)(956004)(186003)(6916009)(316002)(8676002)(2616005)(44832011)(5660300002)(16526019)(66946007)(478600001)(26005)(66556008)(66476007)(36756003)(52116002)(6486002)(7696005)(86362001)(8936002)(1076003)(2906002)(4326008)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 zvKlLoQqKo/3m1mpLPJD78NOloPk1zBaIr7N8wjjzsgiHNsXHRNr9qSzFD0MG/j8XetX4hv/I3ljEgjioEbeCAg5tRFwxNPmwzsTxB17TJMMiGfvehwGnuWigbESVqxAaVoFsw0Xdpy7/ef6s9mKUVk45vaFGHPLryxn1uuggtL4kdfUAYaFXgon0LKK0KY/3Co81sg+ZLBA5+3Kas/oghtAuugiVkaYkZvuwJDs9UhF45kOW6kJLMjXwawqNMtce6PE1TKqQRAtyd66HElc7UBsz0pbJ0XjK4CjQx0TZpurzaglxxoC+lkLcJCfblbqIAE6BsbtzB5pgvRfX7VfH1MNfGaWSQ8bu4wI+SehP8pmc/3EKonK7jSvCp7glKf/DSUN9gqfEDsNnUGQI9W00UO0ca2gi4v7GQSdlTPR+yDrOcfm7eVBg6jRUks1ooRxxyPjsbDyoONh/NL3oxkWlBxVbeZdRyGX6DQA/gYnGqjV4eOm7++Zrz3w3FM/4eItiWE/33BzqP+aiVB53KQ/umHDu4xRS7HAE97sSJRSUTzZLCee1FG9vFaoVjq75cWOo9DrwlK1z+iW5syv9LKcGlrIvjgnGIbIMoVGxgUqDCfMhxURsK8UlShvh8LRGcJsCMY038ntvymE81TuELuktw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5525
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	13dc8cc5-2280-4b36-50fc-08d87cbb1738
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xiLQQwy1gInteo4maJXUKTmKKPRskZrEkOkFYNqhBDREkqfQlJpNHVslOGApEjIt3Tn4rlbEPY2yQKne/fPhrqnhJpoomHfyZiG0Ij8yQvC29XE198JpKR0c4zdQ0EDFtoGyizhFKRId4vdeNIFruod4P/fBMUgCmVMrZAtWdmXN4ID7wAT1l1mGkR5gfZwJo+lty3weeVPQWhv4jt9G9koOCNLlSS1aEvfHrK2SEHl4V+7iBKq3wuOzpBuml25+C8O8p22Bv5/Gb/4fj5aa8byX6AzpfLqMQdqDkizhhMnF2FG/vI0CNCjo5d88oW3DucI/0aGMZoFJc1qyYU2TZXhu8r3nw1bRHShnnxpf0AKB25wKPeSCEfVr6hr+OdoOuzRmTJ+4QhsUfzVU16hQjQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39850400004)(136003)(46966005)(5660300002)(26005)(1076003)(478600001)(186003)(70586007)(70206006)(36906005)(8676002)(336012)(7696005)(36756003)(86362001)(4326008)(6916009)(44832011)(8936002)(2616005)(6666004)(6486002)(316002)(16526019)(82310400003)(83380400001)(47076004)(356005)(82740400003)(956004)(2906002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 10:04:26.3882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b23609-0f44-429b-daa5-08d87cbb2f23
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2591
Content-Type: text/plain

From: Nathan Dunne <Nathan.Dunne@arm.com>

Created new function for determining guest running state such that
two guests with names such as "myguest" and "myguest2" report
correctly, by searching for exact guestname instead of contains.

Also modified the status command to use the same function to avoid
duplication, and added a new nested function for testing status for
a particular guest, instead of recursively calling the whole bash
script.

Using the nested function speeds up "xenguest-manager status" from
~7.5s to ~1.5s my machine.

Change-Id: Ie6fc08cacc55f623c44b08478f76031510a59126
Issue-Id: SCM-1517
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
---
 .../xenguest/files/xenguest-manager           | 39 ++++++++++++-------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
index 78ac55d..4ea3a37 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -597,11 +597,22 @@ function check_guest_exist()
     fi
 }
 
+function xl_list_contains()
+{
+    guestname="${1}"
+    # Select first column of xl list, and find guestname exactly using regex
+    running=$(xl list | awk 'NR > 1 {print $1}' | grep "^${guestname}$" || echo)
+    if [ "${running}" = "${guestname}" ]; then
+        return 0
+    fi
+
+    return 1
+}
+
 function check_guest_running()
 {
     guestname="${1}"
-    running=$(xl list | awk 'NR > 1 {print $1}' | grep "${guestname}" || echo)
-    if [ ! "${running}" = "${guestname}" ]; then
+    if ! xl_list_contains $guestname; then
         echo "${PREF} Guest ${guestname} is not running"
         exit 1
     fi
@@ -610,8 +621,7 @@ function check_guest_running()
 function check_guest_not_running()
 {
     guestname="${1}"
-    running=$(xl list | awk 'NR > 1 {print $1}' | grep "${guestname}" || echo)
-    if [ "${running}" = "${guestname}" ]; then
+    if xl_list_contains $guestname; then
         echo "${PREF} Guest ${guestname} is running"
         exit 1
     fi
@@ -668,10 +678,8 @@ case ${cmd} in
         guestname="${arg1:-}"
         check_guest_arg ${cmd} ${guestname}
         check_guest_exist ${guestname}
-        # We need to stop the guest first
-        running=$(xl list | awk 'NR > 1 {print $1}' | grep "${guestname}" \
-            || echo)
-        if [ "${running}" = "${guestname}" ]; then
+        # We need to stop the guest first if it is running
+        if xl_list_contains $guestname; then
             echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
             xl destroy ${guestname} >> ${LOGFILE} 2>&1
             if [ $? -ne 0 ]; then
@@ -719,20 +727,25 @@ case ${cmd} in
         fi
         ;;
     status)
-        guestname="${arg1}"
-        if [ -n "${guestname}" ]; then
+
+        single_status() (
+            guestname="${1}"
             check_guest_exist ${guestname}
-            if xl list | awk 'NR > 1 {print $1}' | grep "${guestname}" > \
-                /dev/null 2>&1; then
+            if xl_list_contains $guestname; then
                 echo "${guestname}: Running"
             else
                 echo "${guestname}: Stopped"
             fi
+        )
+
+        guestname="${arg1}"
+        if [ -n "${guestname}" ]; then
+            single_status ${guestname}
         else
             guestlist=$($this list)
             if [ -n "${guestlist}" ]; then
                 for f in ${guestlist}; do
-                    $this status $f
+                    single_status $f
                 done
             fi
         fi
-- 
2.17.1

