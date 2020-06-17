Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.41])
 by mx.groups.io with SMTP id smtpd.web11.1575.1592373761417103493
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 23:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=uQqzuYn3;
 spf=pass (domain: arm.com, ip: 40.107.21.41, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MenLp80jkXhhUdRxsS3NZggFgyAEeFaK8UT5nDX2uD8=;
 b=uQqzuYn3I3AP9srVvTwA8iRfBaFDGRu5a+oD5haKEnhL2+/j9mNWk7pC/T2hk93SE7QqieM4wG3KLFe2EIKQLP9HmmxE0FmDx8ZWc2d3Gs1DjMsSqeXRTnpfSzdPiciR0sTPvAkhBCVT1H54/DMgUUBVs58adXPZDKf/J6ssnv0=
Received: from MR2P264CA0050.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:31::14)
 by VI1PR0801MB1647.eurprd08.prod.outlook.com (2603:10a6:800:59::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Wed, 17 Jun
 2020 06:02:32 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:31:cafe::47) by MR2P264CA0050.outlook.office365.com
 (2603:10a6:500:31::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend
 Transport; Wed, 17 Jun 2020 06:02:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 06:02:31 +0000
Received: ("Tessian outbound b2c4593baa67:v59"); Wed, 17 Jun 2020 06:02:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b908053aac0c1cd5
X-CR-MTA-TID: 64aa7808
Received: from 56ea94839b5f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DB2C14FF-EE38-423F-8C28-8EBEB99B0B9E.1;
	Wed, 17 Jun 2020 06:02:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 56ea94839b5f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 17 Jun 2020 06:02:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAigFN7bZ2/DQn7BfSk0oETPCu+Bi/3dTQKW0prdht6NLU9uPog4eqJ8G44rufY9LcEqm43h+npQ3+KOLOWzoSyI1M/lFP6eDpW/Fb+YgYETGS40GCuy12WEl+RRGTnm++CEunbY8RGrQjRRl63duKqKRawieetF2EzCsLO+Mxa0/c090g8eaIv6lI/pb8TduB+m1lZt+odfZWgawGROyWomtCacMfAgIxQPtK61aePU2zpZIonPoFJvgvb45Q+fOljG88u3m4Z0SWcHy3/3rh2CJD7eh2wrnw+5QPvYk/HcdRZCF4E12lUzaVDwRmUr4Ufv7mW8rxABW3C/2iZaXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MenLp80jkXhhUdRxsS3NZggFgyAEeFaK8UT5nDX2uD8=;
 b=aIdHAnFoTcfBdf7Uli50x9W7PbE7mOmri1uXz8cAcUTqxfTFoLCZJYB0DDZ1zGjfYtPePncrtzycKdFZ1s77bdGat73ZctcjygQqi2J5snRNTR9IY2JKe/B2u2BfSb9Qp//dkahrC5iegcVlRwxTp/RwxpzeOolAukfTD6EC/uE0ghtVLnoELmaE6d0fDFJfacelhVufzdHCKPjGtLsuCGCin8rR/WeozYgw3URzu5Ohri+UsqTS4pu0rCsju9r9nVjFjCRFv7f2l96kan7tqMBtIFZp2HUe9hvs/gRVVxVZ3nFMQ1iZGq+tUnOyw8SkzBWjEwbrBELpU6tpoCqq1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MenLp80jkXhhUdRxsS3NZggFgyAEeFaK8UT5nDX2uD8=;
 b=uQqzuYn3I3AP9srVvTwA8iRfBaFDGRu5a+oD5haKEnhL2+/j9mNWk7pC/T2hk93SE7QqieM4wG3KLFe2EIKQLP9HmmxE0FmDx8ZWc2d3Gs1DjMsSqeXRTnpfSzdPiciR0sTPvAkhBCVT1H54/DMgUUBVs58adXPZDKf/J6ssnv0=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4948.eurprd08.prod.outlook.com (2603:10a6:208:163::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 17 Jun
 2020 06:02:25 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::e04c:44c6:7baf:a3b7]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::e04c:44c6:7baf:a3b7%7]) with mapi id 15.20.3088.028; Wed, 17 Jun 2020
 06:02:25 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm-autonomy, xenguest-manager: Guest creation failure cleanup
Date: Wed, 17 Jun 2020 07:02:24 +0100
Message-Id: <1592373744-85392-2-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592373744-85392-1-git-send-email-diego.sueiro@arm.com>
References: <1592373744-85392-1-git-send-email-diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0412.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::16) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.51) by LO2P265CA0412.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a0::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3109.21 via Frontend Transport; Wed, 17 Jun 2020 06:02:25 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: accc8b10-9d07-4960-ee2f-08d81284061a
X-MS-TrafficTypeDiagnostic: AM0PR08MB4948:|VI1PR0801MB1647:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB16471498EF72FBABB2B07189929A0@VI1PR0801MB1647.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 FizAjPPv9xzNbiYTeLFdjj5YyMmZDeFmk54XWKOolJwq7XvLOmuB+LBu82sWXSATxxBQtT8TE+eiuaeuGv9ygENrRATJp1xnhMo20AU4wvTEAITemrhVxUNlnhlxV/cm64vTGw+1fRiAuHZqS8kMPeB63TcNmaBEPGZ6ojPudVqj9MoaJ1/5YqNhWT5rGBEcjpw5cPkNU5NOgwZYUGBuO9Hs3Y/2mibAw6uEzDhTgCH88FmE/hbCQ+ZlZYdoQZDZMCv713hMw1W95O8+OlZ5G+o0tVbw7SeuKiRZTGRqyG/9okDBO6xMjsbVrXiuoFy9
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(39850400004)(396003)(136003)(346002)(26005)(2906002)(16526019)(66946007)(66556008)(66476007)(316002)(52116002)(7696005)(186003)(4326008)(5660300002)(83380400001)(478600001)(6486002)(44832011)(956004)(2616005)(8936002)(86362001)(8676002)(36756003)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 OE6cGKjkP8nTRwqlgRR5fID3Y35XoEhM0vSVXQFN3U3iGfLDHOfRxKAZWhG3F5Ah1ai+4l2u0aodlip/Y5/kj05mVBA1DbuFqKH2tfJVwleHSKRt7F0krkE6UF4umQpQrGH7dOVZwxm1pM35RhMdMbDggFwEWkKDMj37JkrX4hjTGGULmuRNAriX97j7g/UGRAXC/xzgHx/Bt3RmvZRLSwV5IPmA0rcgdmfxfHzS4xbtRQO4rpDDTdCE67TVtifdAsSWKdC5cilOuAkmr1KULA7tCCFkLWedB9vf/nB/BaGEfiqpQ8xI8ZM6tama+J3SG9YxynC8bC0XwEuwbdIPOjDdHUMcTaJ0U4mXCFkOvAVuaCrhfJPtEm8H8YlASN7p7nrZD0d/X2uPYt6eDy3cdQ8VK6LJahIBTpJTmuT9kRxnueDFAKO9dRiZM0C40BoTH25WnN3Pe2XB/YJLoXSFaMImijpRUpeagSil+kBlCu6B262YadXzOHNAo3ZtmAEJ
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4948
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(396003)(39850400004)(136003)(46966005)(186003)(26005)(6486002)(83380400001)(316002)(70586007)(36756003)(478600001)(44832011)(16526019)(70206006)(6916009)(356005)(86362001)(82740400003)(5660300002)(47076004)(4326008)(36906005)(956004)(2616005)(8676002)(336012)(2906002)(7696005)(8936002)(81166007)(82310400002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0d564e41-dd48-446c-ab6a-08d812840201
X-Forefront-PRVS: 04371797A5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nV0pV2u9s5veKZvrKokRyAl/SVsPtV7yt8RdzIdf42cm6bQzdV+zhCoXzV1MBiatGKry/nrhd+hUyF5upcyatuyhUHoM18tY0AqnpWiItu7WpN5cU/7Icn4T4rs7nRsoZ6J+2Gz8KPlftp5KOa00SfQhisbxwvlOTeLOSSKf3GosIgLiDHRAe1kxHxpC6QRs/t19Y4D+yKPwFCDJwEOzMuMFyaKSMKit322Y/fkdbK6SvTWU8VydK+fkH8X5gQQA3PEog1xQhLg/W3x6NmRakBJT+qUu7CpfUJ6SPiJ3S4GiZdAAon1oQfPnaRi3ImozNwQHWP0r0ewpNt8GOZye5p4dNIT0dQC+NtxvR/HJjBRL2yrMAn1eTNMszXQDM2KaLBrg3OtCa5QwPvLQc81DaQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 06:02:31.8857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: accc8b10-9d07-4960-ee2f-08d81284061a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1647
Content-Type: text/plain

When the guest creation process fails, we need to perform a proper
cleanup on the system, like removing configuration files and detaching
the disk previously attached to Xen.

This patch also adds an extra failure condition when the partition
assigned to guests is already formatted with a filesystem and it is not
a lvm partition.

Change-Id: I36087bf95fb8ff093160a6df406920fa5f293e09
Issue-Id: SCM-996
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../xenguest/files/xenguest-manager                | 114 ++++++++++++++-------
 .../recipes-extended/xenguest/xenguest-manager.bb  |   2 +-
 2 files changed, 79 insertions(+), 37 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
index 6a10d35..d55c9ff 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -56,10 +56,14 @@ EOF
 
 function xenguest_volume_init()
 {
+    # Return:
+    # 0 - success
+    # 1 - failure
+
     if [ -z "${XENGUEST_VOLUME_DEVICE:-}" -o \
         ! -b ${XENGUEST_VOLUME_DEVICE:-} ]; then
         echo "${PREF} Invalid volume device in configuration: ${XENGUEST_VOLUME_DEVICE:-}"
-        exit 1
+        return 1
     fi
 
     if [ -z "${XENGUEST_VOLUME_NAME:-}" ]; then
@@ -69,14 +73,26 @@ function xenguest_volume_init()
 
     pvs ${XENGUEST_VOLUME_DEVICE} > /dev/null 2>&1
     if [ $? -ne 0 ]; then
-        echo "${PREF} Initialize lvm on ${XENGUEST_VOLUME_DEVICE}"
-        echo "pvcreate -f ${XENGUEST_VOLUME_DEVICE}" >> ${LOGFILE} 2>&1
-        pvcreate -f ${XENGUEST_VOLUME_DEVICE} >> ${LOGFILE} 2>&1
-        if [ $? -ne 0 ]; then
-            echo "${PREF} Error"
-            exit 1
+        # Check if there is no filesystem in the block device
+        echo "lsblk -n -o FSTYPE ${XENGUEST_VOLUME_DEVICE}" >> ${LOGFILE} 2>&1
+        filesystem=$(lsblk -n -o FSTYPE ${XENGUEST_VOLUME_DEVICE} 2>> ${LOGFILE})
+        if [[ $? -eq 0 && -z "$filesystem" ]]; then
+            echo "${PREF} Initialize lvm on ${XENGUEST_VOLUME_DEVICE}"
+            echo "pvcreate -f ${XENGUEST_VOLUME_DEVICE}" >> ${LOGFILE} 2>&1
+            pvcreate -f ${XENGUEST_VOLUME_DEVICE} >> ${LOGFILE} 2>&1
+            if [ $? -ne 0 ]; then
+                echo "${PREF} Error: initialing lvm on " \
+                     "${XENGUEST_VOLUME_DEVICE} failed." | tee -a ${LOGFILE}
+                return 1
+            fi
+        else
+            [ -z "$filesystem" ] || \
+                echo "${PREF} Error: The ${XENGUEST_VOLUME_DEVICE} is already " \
+                     "formatted as $filesystem." | tee -a ${LOGFILE}
+            return 1
         fi
     fi
+
     vgs ${XENGUEST_VOLUME_NAME} > /dev/null 2>&1
     if [ $? -ne 0 ]; then
         echo "${PREF} Create ${XENGUEST_VOLUME_NAME} volume"
@@ -85,10 +101,13 @@ function xenguest_volume_init()
         vgcreate ${XENGUEST_VOLUME_NAME} ${XENGUEST_VOLUME_DEVICE} \
             >> ${LOGFILE} 2>&1
         if [ $? -ne 0 ]; then
-            echo "${PREF} Error"
-            exit 1
+            echo "${PREF} Error: creating ${XENGUEST_VOLUME_NAME} volume " \
+                 "failed."  | tee -a ${LOGFILE}
+            return 1
         fi
     fi
+
+    return 0
 }
 
 # Detach a disk we attached to xen
@@ -102,12 +121,21 @@ function xenguest_detach_disk()
         >> ${LOGFILE} 2>&1
     if [ $? -ne 0 ]; then
         echo "${PREF} Error detaching partition ${part}"
-        exit 1
+        return 1
     fi
 }
 
 function xenguest_disk_init()
 {
+    # Inputs:
+    # $1 - guestname
+    # $2 - guestfile
+    #
+    # Outputs:
+    # 0 - success
+    # 1 - failed at guest disk preparation
+    # 2 - failed at guest disk creation
+
     guestname="$1"
     guestfile="$2"
     devname="/dev/${XENGUEST_VOLUME_NAME}/${guestname}"
@@ -119,12 +147,16 @@ function xenguest_disk_init()
         return
     fi
 
-    echo "${PREF} Create ${guestname} disk"
+    echo "${PREF} Create ${guestname} disk."
 
     # Init our volume
-    xenguest_volume_init
+    xenguest_volume_init ${guestname}
+    if [ $? -ne 0 ]; then
+        return 1
+    fi
 
-    echo "${PREF} Create hard drive for ${guestname}"
+    echo "${PREF} Create hard drive for ${guestname}." \
+         "This might take a while..."
 
 
     # Remove volume if it already exist
@@ -135,7 +167,7 @@ function xenguest_disk_init()
         lvremove -y ${devname} >> ${LOGFILE} 2>&1
         if [ $? -ne 0 ]; then
             echo "${PREF} Error removing volume ${guestname}"
-            exit 1
+            return 1
         fi
     fi
 
@@ -146,7 +178,7 @@ function xenguest_disk_init()
         >> ${LOGFILE} 2>&1
     if [ $? -ne 0 ]; then
         echo "${PREF} Error creating volume ${guestname}"
-        exit 1
+        return 1
     fi
 
     # Add partition table
@@ -154,7 +186,7 @@ function xenguest_disk_init()
     parted -s ${devname} mklabel msdos >> ${LOGFILE} 2>&1
     if [ $? -ne 0 ]; then
         echo "${PREF} Error creating partition table on ${guestname}"
-        exit 1
+        return 1
     fi
 
     # Setup disk name in xen configuration
@@ -164,7 +196,7 @@ function xenguest_disk_init()
         --xen-disk=${devname} >> ${LOGFILE} 2>&1
     if [ $? -ne 0 ]; then
         echo "${PREF} Error setting disk in xen configuration"
-        exit 1
+        return 1
     fi
 
     # Create partitions
@@ -197,7 +229,7 @@ function xenguest_disk_init()
                 ${partend} >> ${LOGFILE} 2>&1
             if [ $? -ne 0 ]; then
                 echo "${PREF} Error adding partition ${part}"
-                exit 1
+                return 1
             fi
 
             # Set next partition start to current partition end
@@ -219,7 +251,7 @@ function xenguest_disk_init()
                     *)
                         echo "${PREF} partition ${part} of ${guestname}" \
                             "fstype is invalid: ${fstype}"
-                        exit 1
+                        return 1
                         ;;
                 esac
             else
@@ -231,7 +263,7 @@ function xenguest_disk_init()
             xl block-attach 0 phy:${devname} xvda w >> ${LOGFILE} 2>&1
             if [ $? -ne 0 ]; then
                 echo "${PREF} Error attaching partition ${part}"
-                exit 1
+                return 1
             fi
 
 
@@ -247,8 +279,7 @@ function xenguest_disk_init()
 
             if [ ! -b /dev/xvda${part} ]; then
                 echo "${PREF} Partition ${part} creation error"
-                xenguest_detach_disk
-                exit 1
+                return 2
             fi
 
             if [ -n "${formatcmd}" ]; then
@@ -256,8 +287,7 @@ function xenguest_disk_init()
                 ${formatcmd} /dev/xvda${part}
                 if [ $? -ne 0 ]; then
                     echo "${PREF} Cannot create partition ${part} FS"
-                    xenguest_detach_disk
-                    exit 1
+                    return 2
                 fi
             fi
 
@@ -277,8 +307,7 @@ function xenguest_disk_init()
                         *)
                             # invalid/unknown compression type
                             echo "${PREF} Invalid file format in disk ${content}"
-                            xenguest_detach_disk
-                            exit 1
+                            return 2
                             ;;
                     esac
                     # dd into partition
@@ -288,8 +317,7 @@ function xenguest_disk_init()
                         | ${decompress} | dd of=/dev/xvda${part} >> ${LOGFILE} 2>&1
                     if [ $? -ne 0 ]; then
                         echo "${PREF} Cannot populate partition ${part}"
-                        xenguest_detach_disk
-                        exit 1
+                        return 2
                     fi
                     ;;
                 *.tar*)
@@ -310,8 +338,7 @@ function xenguest_disk_init()
                         *)
                             # invalid/unknown tar type
                             echo "${PREF} Invalid file format in disk ${content}"
-                            xenguest_detach_disk
-                            exit 1
+                            return 2
                             ;;
                     esac
 
@@ -321,9 +348,8 @@ function xenguest_disk_init()
                     mount /dev/xvda${part} ${mntdir} >> ${LOGFILE} 2>&1
                     if [ $? -ne 0 ]; then
                         echo "${PREF} Cannot mount partition ${part}"
-                        xenguest_detach_disk
                         rm -rf ${mntdir}
-                        exit 1
+                        return 2
                     fi
 
                     # tar and unmount
@@ -336,16 +362,14 @@ function xenguest_disk_init()
                         echo "${PREF} Cannot populate partition ${part}"
                         umount ${mntdir}
                         rm -rf ${mntdir}
-                        xenguest_detach_disk
-                        exit 1
+                        return 2
                     fi
                     echo "umount ${mntdir}" >> ${LOGFILE} 2>&1
                     umount ${mntdir} >> ${LOGFILE} 2>&1
                     if [ $? -ne 0 ]; then
                         echo "${PREF} Error unmounting ${part}"
-                        xenguest_detach_disk
                         rm -rf ${mntdir}
-                        exit 1
+                        return 2
                     fi
                     rm -rf ${mntdir}
                     ;;
@@ -356,6 +380,9 @@ function xenguest_disk_init()
 
             # Detach disk
             xenguest_detach_disk
+            if [ $? -ne 0 ]; then
+                return 1
+            fi
         fi
     done
 
@@ -392,10 +419,21 @@ function xenguest_guest_create()
         --xen-name=${guestname} >> ${LOGFILE} 2>&1
     if [ $? -ne 0 ]; then
         echo "${PREF} Error setting guest name"
+        xenguest_guest_remove ${guestname}
         exit 1
     fi
 
     xenguest_disk_init ${guestname} ${guestfile}
+    disk_init_status=$?
+    if [ $disk_init_status -ne 0 ]; then
+        echo "${PREF} Error: ${guestname} disk creation failed."
+        if [ $disk_init_status -eq 2 ]; then
+            xenguest_detach_disk
+        fi
+        xenguest_guest_remove ${guestname}
+        exit 1
+    fi
+
 }
 
 function xenguest_guest_remove()
@@ -408,6 +446,7 @@ function xenguest_guest_remove()
     lvs ${XENGUEST_VOLUME_NAME}/${guestname} >> ${LOGFILE} 2>&1
     if [ $? -eq 0 ]; then
         # Remove guest volume
+        echo "${PREF} Removing ${guestname} volume. This might take a while..."
         echo "lvremove -y ${devname}" >> ${LOGFILE} 2>&1
         lvremove -y ${devname} >> ${LOGFILE} 2>&1
         if [ $? -ne 0 ]; then
@@ -417,6 +456,7 @@ function xenguest_guest_remove()
     fi
 
     # remove guest files
+    echo "${PREF} Removing ${guestname} configuration files."
     rm -rf ${XENGUEST_CONF_BASE}/guests/${guestname}
 }
 
@@ -602,6 +642,7 @@ case ${cmd} in
         fi
 
         xenguest_guest_create ${guestfile} ${guestname}
+        echo "${PREF} ${guestname} created."
         ;;
     remove)
         guestname="${arg1:-}"
@@ -619,6 +660,7 @@ case ${cmd} in
             fi
         fi
         xenguest_guest_remove ${guestname}
+        echo "${PREF} ${guestname} removed."
         ;;
     start)
         guestname="${arg1:-}"
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
index 65925d2..bd7963f 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
@@ -46,7 +46,7 @@ do_install() {
 }
 
 # Things that we need on the target
-RDEPENDS_${PN} += "bash tar xenguest-mkimage lvm2 xen-tools parted e2fsprogs"
+RDEPENDS_${PN} += "bash tar xenguest-mkimage lvm2 xen-tools parted e2fsprogs dosfstools"
 
 FILES_${PN} += "${bindir}/xenguest-manager \
                ${sysconfdir}/xenguest"
-- 
2.7.4

