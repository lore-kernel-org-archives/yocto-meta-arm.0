Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.65])
 by mx.groups.io with SMTP id smtpd.web11.10850.1603710768077126367
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 04:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=9lCQ+rrO;
 spf=pass (domain: arm.com, ip: 40.107.22.65, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMiU++5+h4pWpQ70Fp93dbXDPBW4gU7Ah+67p3rZ9Vs=;
 b=9lCQ+rrOiv0Hdk4CZ7zpmWXPrh8pIk3xd5fovo5Ppevv7oa3oUTiTVJOBu3/VFNXFyLlesHJWgsO/xL/rLrR9tcNttDNKUk+LiGjhfedWf9ezoC2EnPomWWifLTNK/E4aP00HtusSYkqMyNDLLUxHOqKEslEuDqNRfzjN2bZ9pU=
Received: from AM5PR0602CA0010.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::20) by PA4PR08MB6174.eurprd08.prod.outlook.com
 (2603:10a6:102:e6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Mon, 26 Oct
 2020 11:12:45 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::9b) by AM5PR0602CA0010.outlook.office365.com
 (2603:10a6:203:a3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Mon, 26 Oct 2020 11:12:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Mon, 26 Oct 2020 11:12:45 +0000
Received: ("Tessian outbound d5e343850048:v64"); Mon, 26 Oct 2020 11:12:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c2739e27fb39c5fc
X-CR-MTA-TID: 64aa7808
Received: from 369cce6e26c4.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4B1CA6FB-1738-4450-AAA2-85B7A7479656.1;
	Mon, 26 Oct 2020 11:12:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 369cce6e26c4.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 26 Oct 2020 11:12:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1Z8T5BO6vzJ7VheMFmr5LH0hIzRSNByrakshshoa7nh+RTnwYo1xA0ugZWHoTvHd49xulDLpHA6z1n7SaQjxMjiol2dj9mHQznb4MC15jzEpMvd8GoEtids6r5Gt4BK5N9lNTmKeAGogCXAWiZtaIYP8MWLVNiAx8UF5bja3z34DlQK8rleILZTkcsUK4iySbIgHl09UEQcEko7s1QZIEBhfVrpS1vuffdgC3BcVvJCwPqUyMAgAj5bPP3W9BWLMC9N9gNKBVcTeGVtlTunln6Fv4pMZiL3mxgSqr2TXq9rAmZ1/bOUL61+VBqFqjnsOc12rXLsvgP+0JhqltFZPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMiU++5+h4pWpQ70Fp93dbXDPBW4gU7Ah+67p3rZ9Vs=;
 b=ePqthknYoOXoQiF+n/aSN3heXTXN0noM3svRy+2Jmt6grxD7VRbV+Ho8/uXSbioDTV1nW3Q6EM9Zb+5dkwUxcO4wPLxLxCrGxKOMhdUnJ8awnC3y5yw/H5C7rWhAgIMSWSawjN7iW69DC5w3HJ27dXaQabjFjyuURnf/QLbdaSSYQsCmfptAF5IZa8C904bEj8MOOju0ToR0wMGDboB8yd6YUjgy2n4JBDLT0T8USw9SuCoA4Vg60AM+Qqa/yDFeKISN0LWzaDG27aSBASYApXeXoaq8mRGf/mbeLOnZlw1J4pXEnG5upZH4la3wDWSnwABojqvln+kP8UzXaLde4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMiU++5+h4pWpQ70Fp93dbXDPBW4gU7Ah+67p3rZ9Vs=;
 b=9lCQ+rrOiv0Hdk4CZ7zpmWXPrh8pIk3xd5fovo5Ppevv7oa3oUTiTVJOBu3/VFNXFyLlesHJWgsO/xL/rLrR9tcNttDNKUk+LiGjhfedWf9ezoC2EnPomWWifLTNK/E4aP00HtusSYkqMyNDLLUxHOqKEslEuDqNRfzjN2bZ9pU=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB5239.eurprd08.prod.outlook.com (2603:10a6:20b:e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Mon, 26 Oct
 2020 11:12:43 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 11:12:43 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH 2/2] arm-autonomy/xenguest-manager: Allow guests named 'guest'
Date: Mon, 26 Oct 2020 11:12:23 +0000
Message-Id: <dc33f0ecaeca7074baf9ea47cb4a32fd51661a3e.1603710589.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <a71da05f15122d0b28f6b6186c67f79dcd8ea973.1603710589.git.diego.sueiro@arm.com>
References: <a71da05f15122d0b28f6b6186c67f79dcd8ea973.1603710589.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.52]
X-ClientProxiedBy: MRXP264CA0039.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::27) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.52) by MRXP264CA0039.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.18 via Frontend Transport; Mon, 26 Oct 2020 11:12:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e76bb04a-2f73-4635-abb9-08d879a01073
X-MS-TrafficTypeDiagnostic: AM6PR08MB5239:|PA4PR08MB6174:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB6174AF1FE9ADFB968BDA347492190@PA4PR08MB6174.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:972;OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 5K4ruLy7RHaDOn33EKr/6I8EX82PaqZm4JGFEImY6eZ26OxdeXHJnyDZiLmdVocuMDBSLRDneaDxoEC/i4i+ld2d2gR78at1VKd4olujyFcmadoZbOGnAMyUnwu5OFq9GqOitlzIxz4OQO7zIkKKVPSCmdUMy7tha3WR37dz1aSveHew1LijJ6KVehJ1yOGf0sJd9ALjO6ZObD/Ionjtbt9gcEOhfyM2Fd37KtmSjHLnrVoenywuER+p9GN9CT7r9aLn7WomdaMNDAaG22stroo5ItU5PhA69aEZsr6+gr/oDkSJlQjoVmyoXGNCyJGb
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(6666004)(44832011)(6486002)(8936002)(4326008)(36756003)(2906002)(316002)(8676002)(83380400001)(66476007)(86362001)(478600001)(52116002)(16526019)(5660300002)(26005)(66946007)(2616005)(66556008)(7696005)(956004)(186003)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 D/beZziT1LwA9D6gHzZ558AUVp4LmdY8i8EkpTMBFps0GNnlMITmbejY8k4RH+gXBA4d9d/e1kYDi85nSESmIXbV0YGtBF/yZyU/KBWLgUlfuGInCR05eB7evEZb9F2XSNAMyrUSn52eRj58M7fWo4NCZysglcEMC6oaUQ0nFOT3z1NCSqOYFs1PBh6tj/ohjAWm5zCBO2u25Akl+olX8guxRe2mMxPccvOBDZyDykiDr0srO7uZl69BRPCSEciapgL/X4G3FIEuCPffAF+2qNbMzEJOCF7Dxq1Warrr2/dkOooXVljWtVsUXLDrbFjuKbKf3w5ZsfIJ1RFk08cXXv/QGXVQ4SSYflSTWqvOAaNxIlb2tK9GjSmNTtv/tOyq+jD+a8em9EZvZ46nE53ju/tENWHTgPty5nWa1TFERGCHC/gUJSAaX0Fw/x6S2EFAgtdB63tQKpPCogIbhnwbd422ATao1azi8zMo/fWq/W1pqPVo8JEHOugWFII6vs0xGVKe/a/F3vzwoxyti6eEzpQOgvF6mU/I6xvJZ0E6noz3nN50MJ+lYadRmdWjDfYTJRCxt4cPips/st9F4CNMdr0IpPuTyhwEN0Gb/2JuF87qPvicG5Qn2ZlVI8JyqzzOZ7RSfePweAtR0aboWJbWPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5239
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	95e0bfa0-2e2b-42e3-569d-08d879a00f2d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Zo+vSfZe5Ic/PGc4l4BRneG1Tp3bNgkkDHxLyKhaCT4JtIdR+ogT7HYVvpvhZ7HxKQuD+8hc5ASDjF/hSwA1WRAksb/b5034/dvgw4KDLTjQicrHRAj5RZHZB2dU4VGs+oowGxl4xOb98dTtHNGbqD5DVm2JTd1p6lDbju2TO8rFSOLbRNLDTS0UyN6FYGb/iARU+TPnvj8rqmiF9N2nBIb2LtGCtvHjadbkeP2d2ZOEEQ0/0keiDdwBvzWh6IlscH0oKldAZvJ/1Oxb9QRBG3jUksm96kgwB2bD7PN//hdngy2ARRLV80Oz36YSQrvmbr4HEw0r/MIHxKOHeNMtSyIZ+l8ip6nhUjEv4pV2uCNzt8ysfgYYfpNNy7OZelxE8r83OepprjS2W5B8nBC2NA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966005)(83380400001)(2616005)(6916009)(47076004)(6486002)(336012)(36756003)(356005)(82310400003)(81166007)(186003)(16526019)(5660300002)(26005)(6666004)(44832011)(8676002)(956004)(7696005)(70206006)(70586007)(316002)(82740400003)(2906002)(36906005)(478600001)(4326008)(8936002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2020 11:12:45.0060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e76bb04a-2f73-4635-abb9-08d879a01073
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6174
Content-Type: text/plain

From: Nathan Dunne <Nathan.Dunne@arm.com>

Prevented name collision on file guest.cfg when the name of the
guest is exactly 'guest'. Config is now piped into a tmp file
which can safely be deleted at the end of the start operation.

Change-Id: Id08ac08e52e9e64c508c841b257ecb28ed9d44ae
Issue-Id: SCM-1518
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
---
 meta-arm-autonomy/documentation/xenguest-manager.md  |  8 +++++---
 .../xenguest/files/network-bridge.sh.in              |  4 ++--
 .../recipes-extended/xenguest/files/xenguest-manager | 20 +++++++++++---------
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/meta-arm-autonomy/documentation/xenguest-manager.md b/meta-arm-autonomy/documentation/xenguest-manager.md
index 93453bf..5a66e8a 100644
--- a/meta-arm-autonomy/documentation/xenguest-manager.md
+++ b/meta-arm-autonomy/documentation/xenguest-manager.md
@@ -83,11 +83,13 @@ Inside the directory, scripts will be executed in alphabetical order.
 Since these scripts are sourced by xenguest-manager they can acccess functions
 and variables from the parent file's scope, including:
 
-- ${guestname} : The name of the guest being created
+- ${guestname}    : The name of the guest being created
 
-- ${guestdir}  : The path to the guest directory
+- ${guestdir}     : The path to the guest directory
 
-- ${LOGFILE}   : The file to append any logging to, e.g.
+- ${guestcfgfile} : The name of the config file for the starting guest
+
+- ${LOGFILE}      : The file to append any logging to, e.g.
                      echo "Hello, World" >> ${LOGFILE}
 
 Sourcing also allows the script to access params.cfg.
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
index 42ccb70..27306e4 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
@@ -20,10 +20,10 @@ case "${XENGUEST_NETWORK_TYPE:-}" in
         if [ ! -f /etc/default/dhcp3-server ]; then
             ln -s dhcp-server /etc/default/dhcp3-server
         fi
-        echo "vif = ['script=vif-nat']" >> ${guestname}.cfg
+        echo "vif = ['script=vif-nat']" >> ${guestcfgfile}
         ;;
     bridge)
-        echo "vif = ['script=vif-bridge,bridge=${BRIDGE_NAME}']" >> ${guestname}.cfg
+        echo "vif = ['script=vif-bridge,bridge=${BRIDGE_NAME}']" >> ${guestcfgfile}
         ;;
     *)
         echo "${@}: XENGUEST_NETWORK_TYPE=$XENGUEST_NETWORK_TYPE invalid"
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
index 4d59845..78ac55d 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -465,13 +465,15 @@ function xenguest_guest_start()
     guestname="${1}"
     guestdir=${XENGUEST_CONF_BASE}/guests/${guestname}
 
+    guestcfgfile=$(mktemp -u "${guestname}.XXXXXX" --tmpdir="${guestdir}" --suffix=".cfg")
+
     # Get guest configuration
     source ${guestdir}/params.cfg
 
     pushd ${guestdir} > /dev/null 2>&1
 
     # create config by merging all configurations together
-    cat guest.cfg $(find guest.d -type f 2> /dev/null) > ${guestname}.cfg
+    cat guest.cfg $(find guest.d -type f 2> /dev/null) > ${guestcfgfile}
 
     # Build init script lists (ignore non existing dirs errors,
     # sort alphabetically and run global scripts first)
@@ -491,7 +493,7 @@ function xenguest_guest_start()
             echo "( . $f )" >> ${LOGFILE} 2>&1
             ( . $f ) >> ${LOGFILE} 2>&1
             if [ $? -ne 0 ]; then
-                rm -f ${guestname}.cfg
+                rm -f ${guestcfgfile}
                 popd > /dev/null 2>&1
                 echo "Error in init script $f" >> ${LOGFILE} 2>&1
                 echo "${PREF} Error during pre init script of ${guestname}"
@@ -503,10 +505,10 @@ function xenguest_guest_start()
     done
 
     # Create non started guest
-    echo "xl create -p ${guestname}.cfg" >> ${LOGFILE} 2>&1
-    xl create -p ${guestname}.cfg >> ${LOGFILE} 2>&1
+    echo "xl create -p ${guestcfgfile}" >> ${LOGFILE} 2>&1
+    xl create -p ${guestcfgfile} >> ${LOGFILE} 2>&1
     if [ $? -ne 0 ]; then
-        rm -f ${guestname}.cfg
+        rm -f ${guestcfgfile}
         popd > /dev/null 2>&1
         echo "${PREF} Error starting ${guestname}"
         exit 1
@@ -518,7 +520,7 @@ function xenguest_guest_start()
             echo "( . $f )" >> ${LOGFILE} 2>&1
             ( . $f ) >> ${LOGFILE} 2>&1
             if [ $? -ne 0 ]; then
-                rm -f ${guestname}.cfg
+                rm -f ${guestcfgfile}
                 echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
                 xl destroy ${guestname} >> ${LOGFILE} 2>&1
                 popd > /dev/null 2>&1
@@ -535,7 +537,7 @@ function xenguest_guest_start()
     echo "xl unpause ${guestname}" >> ${LOGFILE} 2>&1
     xl unpause ${guestname} >> ${LOGFILE} 2>&1
     if [ $? -ne 0 ]; then
-        rm -f ${guestname}.cfg
+        rm -f ${guestcfgfile}
         popd > /dev/null 2>&1
         echo "${PREF} Error starting ${guestname}"
         exit 1
@@ -547,7 +549,7 @@ function xenguest_guest_start()
             echo "( . $f )" >> ${LOGFILE} 2>&1
             ( . $f ) >> ${LOGFILE} 2>&1
             if [ $? -ne 0 ]; then
-                rm -f ${guestname}.cfg
+                rm -f ${guestcfgfile}
                 echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
                 xl destroy ${guestname} >> ${LOGFILE} 2>&1
                 popd > /dev/null 2>&1
@@ -560,7 +562,7 @@ function xenguest_guest_start()
         fi
     done
 
-    rm -f ${guestname}.cfg
+    rm -f ${guestcfgfile}
     popd > /dev/null 2>&1
 }
 
-- 
2.7.4

