Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.73])
 by mx.groups.io with SMTP id smtpd.web09.35367.1606138319120335168
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 05:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ut5y9w/z;
 spf=pass (domain: arm.com, ip: 40.107.21.73, mailfrom: nathan.dunne@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EIimWnx350DROp6t4ssZYBdEDwKyN+oUyv19HNSFiI=;
 b=ut5y9w/zsMDRiZu4EU+3GqNg/Q6UGm+nIluCyJgPu0cBrZA6aEt1VMSnXDBIpr0I6M6U+ZWheK7TzjMYCUP/gQIcGA6tf5w3lxkaP7zavA/p7hhdFgNADIAA3LZbLyjCFW14EbKbWwsKRgUKEHYk1MGJQlGrjI6PyhUGK3ChUgY=
Received: from AM4PR07CA0002.eurprd07.prod.outlook.com (2603:10a6:205:1::15)
 by AM0PR08MB3521.eurprd08.prod.outlook.com (2603:10a6:208:dc::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Mon, 23 Nov
 2020 13:31:56 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:205:1:cafe::b7) by AM4PR07CA0002.outlook.office365.com
 (2603:10a6:205:1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.9 via Frontend
 Transport; Mon, 23 Nov 2020 13:31:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 13:31:56 +0000
Received: ("Tessian outbound 082214a64d39:v71"); Mon, 23 Nov 2020 13:31:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 92949a87812afeea
X-CR-MTA-TID: 64aa7808
Received: from f6db9729d819.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 792CED2A-EAA4-48D6-B8D9-C1E9FFA2F12F.1;
	Mon, 23 Nov 2020 13:31:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f6db9729d819.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 Nov 2020 13:31:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMGYcps0rZv9r4IjNxHssJ9uEUerRozx3+qucDLu78QhvNb7u/B+JSd854m+b2Tx9n8DkQRq7zvcXZ/lDHIi5kE5EgClJW/M3go8/RGdAdWKQoEktPAzhz/fU+s0guH3NWdTwvcj9KTD5Z60cDgtLvu44/lXH5FDDOOI/K6yhVHx0Ze9h/DM/ut9/08pj53P4y6vUMK2uyuJnVrg2rqqzwVDe2d6VO+o0XGkwXBRNAzhVOz0awBJqO2oHp6T6P8QJMGQ8gojlAK9+sJFYDRkVyglQ+UtqLEfMUWIwatyJpZMVkwX4FTfapR/6UotiUDPLe2fmmdoNZG3Qk5Z0XrZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EIimWnx350DROp6t4ssZYBdEDwKyN+oUyv19HNSFiI=;
 b=MYcORzNvzZejXLPQ+zAouRozytVJy5pDuINmsjeIp9I39L7KncuXCb4Gqzpz/ALgqJgaeC8BJRTBOEZc2dhyuRLgL6B/MgS5CBlaBflXybu6rhTpTDxHl7eDcqPHrxmMheqXmml8VHDu+PJM04LeJT1S/ht/qzF6agbmHbhSRhhjep8VlHzyggFZG4W1Y2v4lFPTDjKoKlCCA75Mb5wAFpOXdH691vQIIOAmuKZNyJnwmLgULIl2JXJ/n6u1JY1mK9d9AHCPNp64Dm606aROhT2St6i5Wy26c2x7Z/ZTqp9gQOHbF79A1RaORECcyUsJaBl4OdVgrx6MBX28JZy+jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EIimWnx350DROp6t4ssZYBdEDwKyN+oUyv19HNSFiI=;
 b=ut5y9w/zsMDRiZu4EU+3GqNg/Q6UGm+nIluCyJgPu0cBrZA6aEt1VMSnXDBIpr0I6M6U+ZWheK7TzjMYCUP/gQIcGA6tf5w3lxkaP7zavA/p7hhdFgNADIAA3LZbLyjCFW14EbKbWwsKRgUKEHYk1MGJQlGrjI6PyhUGK3ChUgY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from PR3PR08MB5785.eurprd08.prod.outlook.com (2603:10a6:102:89::6)
 by PA4PR08MB5952.eurprd08.prod.outlook.com (2603:10a6:102:e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Mon, 23 Nov
 2020 13:31:48 +0000
Received: from PR3PR08MB5785.eurprd08.prod.outlook.com
 ([fe80::e8e7:483d:766b:3bab]) by PR3PR08MB5785.eurprd08.prod.outlook.com
 ([fe80::e8e7:483d:766b:3bab%4]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 13:31:48 +0000
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH] arm-autonomy/xenguest-manager: Private xenguest-manager functions
Date: Mon, 23 Nov 2020 13:31:25 +0000
Message-Id: <20201123133125.24226-1-Nathan.Dunne@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-ClientProxiedBy: LO2P265CA0189.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::33) To PR3PR08MB5785.eurprd08.prod.outlook.com
 (2603:10a6:102:89::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-natdun02.stack04.eu02.mi.arm.com (217.140.106.52) by LO2P265CA0189.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 13:31:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d2ffa4f7-47ec-4d3e-34ea-08d88fb425c8
X-MS-TrafficTypeDiagnostic: PA4PR08MB5952:|AM0PR08MB3521:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3521896DBE61EA1662F2D8C18DFC0@AM0PR08MB3521.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 R5Ps2KYbVtY5yXlORUHr4tqCWr7SKCaYJ/+3m8ZKws4Bf1u7k1+Io5GOHxwGf6ngKtZYMDHWnxz2jfCwOPClZvyFbvmdO83f8MMrjVG8425/W0gnIZRlpUKTDaFgSn4MRoNGoIBYMzgsbXS0TRU2cB9Q0IWT1OSOAQmP91B85sIdNATFA/RCnjEREpxhU7SSV889lYQsdXJ4l6tgPSEhbWMQmhgrjUJRLljaB4F0Za3O3eG6x6aKYrKWQW9J8BC3pVxbknaWt+7HYbwTIEP+GQYH3da8VlcjvoAcGELIk04I4JdjXXTA67Fp8kfudJ3gWYWdByUYXaY8oz2ES5TnpQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5785.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(1076003)(66946007)(66476007)(66556008)(6666004)(316002)(186003)(26005)(2906002)(16526019)(6486002)(478600001)(2616005)(956004)(7696005)(83380400001)(8936002)(8676002)(5660300002)(36756003)(52116002)(86362001)(6916009)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Bq/Hejxu33zY9B2/IrcrRjUuZy/dagx6dmJJU7cpM1BLR7dwZ7wkbAdIiulR5ycci2yFhIEIol7F0EpvdrjKII5xN7NUueWQS0ZWBl4RUdSkuFiRioGSJGGHxr7EZWAkhTjqRI9ksO7bS9saqdz67ZFjrNci6Nj8irJ8tMbv8VYakfkWNAgq2yGU1hQbvLd/E6Knu3n+6FhT29y6E+J4W/xNvZLuiESMF4tdI0E0xMQhzTF1+gnLSeysNQckmxc9h10U5iwgz0ToL+Att228Vz67NLt+rQMmakVojRdvmksWNswNMgGCamGkAXiXHgrSBytm/Zf3PiCqHcFEM2IhZALGdufPjmXoFGAjfsobiDtp0/8w+ZM8/aoE41jtFgi7tiBy/KONLqDut6FTm8MbUHKu6enTKgtL06eo8CZlj/KPFaHC7aAPjYMxGp5rlYSVrLgIZnAVdaqUx/LfePjvOXgpMPNX7uSNmssNFLwCKn/eQLn2jVlxCedu6VTA4upDe0tHVCI7HmGnQzm9UJ+wUDmbE4/fTr6Lj8ImbuDOxqWKOyKcTcium/lEoO08yX0yx0h7C9b1ULWwYqpCV0XOVxRX9yz4ciaEE921ycaJkdc8FxVKsMt4QCCfgZFNp3RHOe03IFMo+/hp7Z2emYNZDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5952
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Nathan.Dunne@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a6a44ab4-64fb-490e-13f1-08d88fb420bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	buGcUETa75QShdlP/ARgBBRiiUE+Gt4I3KTCyTucRmjNisRXmblH1I8dWRvuazqWEfLsLDBE1wqDfX9KYmxIrEW3XnpGwqOCnfwbvrw8V/omDiFvrUtvN5WDWp1F3Zl/z+lZkqmY+xryCsqJ8DZeTk2rFl9xF7JW7YaImDz5T2EkFBq3nC34BgHeIrWvjh2uecqhsNDvk6aqiAPRIlZgaAvTer5CRYOeDRUCz322QQXDCGWvtNTmJ1Z2hcJ88LHYbyvEAxtH6GtrOVKxTVNAZl+mgF0+WRflYx7wmr6E3whrjMyodbGz9lqnSKTaWKC8ewIWVakJkNB7h2GqIvHBE9fhuIuXCTF7GKJmJq5SPlv6nAlSwrP167vyMG+86wgDhyo7WGzLUgY0M9SE7GSeKg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966005)(26005)(8676002)(82310400003)(82740400003)(8936002)(36906005)(47076004)(186003)(316002)(16526019)(956004)(336012)(2616005)(1076003)(36756003)(83380400001)(6666004)(4326008)(7696005)(5660300002)(81166007)(86362001)(356005)(70586007)(6486002)(6916009)(70206006)(478600001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 13:31:56.3148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ffa4f7-47ec-4d3e-34ea-08d88fb425c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3521
Content-Type: text/plain

Ensure that init scripts sourced on guest start cannot execute functions
from the parent script. This is done using a check for the BASH_SUBSHELL
variable to see the depth of execution.

An error will be thrown if any init script attempts to execute a
function from xenguest-manager

Issue-Id: SCM-1623
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: I87fee51d03a64d99728a7eca1ca789ec7293096b
---
 .../xenguest/files/xenguest-manager           | 44 +++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
index edd9a89..33ec40f 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -54,7 +54,24 @@ with ACTION being one of:
 EOF
 }
 
+# Ensure init scripts in subshells do not call private functions
+function check_private()
+{
+
+    # Return:
+    # 0 - success
+    # 1 - failure
+
+    if [ $BASH_SUBSHELL -ne 0 ]; then
+        echo "Attempted to execute private function ${FUNCNAME[1]} in subshell!"
+        exit 1
+    fi
+}
+
 is_integer() {
+
+    check_private
+
     if ! [[ "${1}" =~ ^[0-9]+$ ]]; then
         >&2 echo "error: invalid number '${1}'"; exit 1
     fi
@@ -62,6 +79,9 @@ is_integer() {
 
 # check size and convert it to MB, e.g '1[G]' => '1000M'
 check_size() {
+
+    check_private
+
     local disksize="${1}"
 
     [ -n "${disksize}" ] || disksize="invalid"
@@ -101,6 +121,8 @@ function xenguest_volume_init()
     # 0 - success
     # 1 - failure
 
+    check_private
+
     if [ -z "${XENGUEST_VOLUME_DEVICE:-}" -o \
         ! -b ${XENGUEST_VOLUME_DEVICE:-} ]; then
         echo "${PREF} Invalid volume device in configuration: ${XENGUEST_VOLUME_DEVICE:-}"
@@ -154,6 +176,8 @@ function xenguest_volume_init()
 # Detach a disk we attached to xen
 function xenguest_detach_disk()
 {
+    check_private
+
     echo "xl block-detach 0 \$\(xl block-list 0 | " \
         "grep \"domain/0\" | awk '{print \$1}'\)" \
             >> ${LOGFILE} 2>&1
@@ -177,6 +201,8 @@ function xenguest_disk_init()
     # 1 - failed at guest disk preparation
     # 2 - failed at guest disk creation
 
+    check_private
+
     guestname="$1"
     guestfile="$2"
     devname="/dev/${XENGUEST_VOLUME_NAME}/${guestname}"
@@ -454,6 +480,7 @@ function xenguest_disk_init()
 
 function xenguest_guest_create()
 {
+    check_private
     guestfile="$1"
     guestname="$2"
 
@@ -502,6 +529,8 @@ function xenguest_guest_create()
 
 function xenguest_guest_remove()
 {
+    check_private
+
     guestname="$1"
     devname="/dev/${XENGUEST_VOLUME_NAME}/${guestname}"
 
@@ -526,6 +555,8 @@ function xenguest_guest_remove()
 
 function xenguest_guest_start()
 {
+    check_private
+
     guestname="${1}"
     guestdir=${XENGUEST_CONF_BASE}/guests/${guestname}
 
@@ -560,7 +591,8 @@ function xenguest_guest_start()
                 rm -f ${guestcfgfile}
                 popd > /dev/null 2>&1
                 echo "Error in init script $f" >> ${LOGFILE} 2>&1
-                echo "${PREF} Error during pre init script of ${guestname}"
+                echo "${PREF} Error during pre init script $(basename $f) of ${guestname}"
+                echo "${PREF} Check the log: ${LOGFILE} for more information"
                 exit 1
             fi
         else
@@ -589,7 +621,8 @@ function xenguest_guest_start()
                 xl destroy ${guestname} >> ${LOGFILE} 2>&1
                 popd > /dev/null 2>&1
                 echo "Error in init script $f" >> ${LOGFILE} 2>&1
-                echo "${PREF} Error during init script of ${guestname}"
+                echo "${PREF} Error during init script $(basename $f) of ${guestname}"
+                echo "${PREF} Check the log: ${LOGFILE} for more information"
                 exit 1
             fi
         else
@@ -618,7 +651,8 @@ function xenguest_guest_start()
                 xl destroy ${guestname} >> ${LOGFILE} 2>&1
                 popd > /dev/null 2>&1
                 echo "Error in init script $f" >> ${LOGFILE} 2>&1
-                echo "${PREF} Error during post init script of ${guestname}"
+                echo "${PREF} Error during post init script $(basename $f) of ${guestname}"
+                echo "${PREF} Check the log: ${LOGFILE} for more information"
                 exit 1
             fi
         else
@@ -632,6 +666,8 @@ function xenguest_guest_start()
 
 function xenguest_guest_stop()
 {
+    check_private
+
     guestname="${1}"
     echo "xl shutdown ${guestname}" >> ${LOGFILE} 2>&1
     xl shutdown ${guestname} >> ${LOGFILE} 2>&1
@@ -643,6 +679,8 @@ function xenguest_guest_stop()
 
 function check_guest_arg()
 {
+    check_private
+
     cmd="${1}"
     guestname="${2:-}"
     if [ -z "${guestname:-}" ]; then
-- 
2.17.1

