Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.44])
 by mx.groups.io with SMTP id smtpd.web10.24001.1605872744807919690
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 03:45:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Bc/Ucxhk;
 spf=pass (domain: arm.com, ip: 40.107.6.44, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkIlez6W5Jfr+jErRErajutAmITpXTx9TvdYcY1ITXU=;
 b=Bc/UcxhkhFMy6qZ77TYgxQN7ID5iofTP2ebdF5GGnkTUI6qlDyUvAcfp3FoBrh1aJ6JVqQimo2l//4iollGaKyCwo76TpHIGZ3LcI4oIPTCUYkP3PCDlCWVBFV3g/cIet8077+BKAQun37WZyHV+WCr3PrV+c1ugk5y1HMg/By8=
Received: from AM6P192CA0104.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::45)
 by DBBPR08MB5914.eurprd08.prod.outlook.com (2603:10a6:10:200::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Fri, 20 Nov
 2020 11:45:43 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::e5) by AM6P192CA0104.outlook.office365.com
 (2603:10a6:209:8d::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Fri, 20 Nov 2020 11:45:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 11:45:42 +0000
Received: ("Tessian outbound 797fb8e1da56:v71"); Fri, 20 Nov 2020 11:45:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e10807c9dfa8e9bf
X-CR-MTA-TID: 64aa7808
Received: from d197914220cc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7E3C9132-F154-4DAB-BCF8-1189430D4642.1;
	Fri, 20 Nov 2020 11:45:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d197914220cc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 20 Nov 2020 11:45:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsosQ1yAX3lXn5xEsbc3xDAAhDMDs7QweoN1363ASWULbaRo0uF9/anHq7W9oIe/4slmIwuh92U4b+e2gLAXwErs/6VAg9hVOlVruPX1aujKXDme2bGjKd/du0ZZHbGz9WKxITsRPxaAec50cH8IprtBhJl9b8jvXA48sFcKm1swOO/ENnN7KEiUvbxKlJyawPezoPrNrr7Jyn2TuvATPe78324ctMoJXxAuEKkGb3/886H86m7EbnoslldLDsliU8COejS+aDPzEEC/tAr/nRPSbxf/uUTlHoAMBr8XcweN0cqDsV9hM6dwxEQwvGuUGwirYgVabR7V+Q5X3izNEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkIlez6W5Jfr+jErRErajutAmITpXTx9TvdYcY1ITXU=;
 b=SKzwaNINvGigkGaLlKR0sbKLbxVMQwEyxafJWUI6A0WML8G745xgA+8xcZum0wiwu6ASyvHfxLSWu310nhdyqyvBAbZRJU7BMQ21kbDIwcRDmx/IDVgvQGil2grS5vbqD/5e+wnVD5FFot70muCVdpbDxyjqIGi4HdAz0IQ11ad07N6OIpoGjSIXm3N98QUF4F+nUxBv+RhTO6nv9zTNponZnXrxdLfmPPbHtZKJT8SBwrPgEFG/Y41CwQakHryOr24ZLP6HcjUez/QBcQLMk5Dq6SRJOS1nq/pbD728CGN3AFAg57xhuBzpTVOJIG76826R8bRAPVQkGpR7MfGGXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkIlez6W5Jfr+jErRErajutAmITpXTx9TvdYcY1ITXU=;
 b=Bc/UcxhkhFMy6qZ77TYgxQN7ID5iofTP2ebdF5GGnkTUI6qlDyUvAcfp3FoBrh1aJ6JVqQimo2l//4iollGaKyCwo76TpHIGZ3LcI4oIPTCUYkP3PCDlCWVBFV3g/cIet8077+BKAQun37WZyHV+WCr3PrV+c1ugk5y1HMg/By8=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBBPR08MB6284.eurprd08.prod.outlook.com (2603:10a6:10:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Fri, 20 Nov
 2020 11:45:37 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::7481:42d7:df72:b159]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::7481:42d7:df72:b159%3]) with mapi id 15.20.3589.020; Fri, 20 Nov 2020
 11:45:37 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 5/5] arm-autonomy/xenguest-mkimage: improve xenguest image checks
Date: Fri, 20 Nov 2020 12:44:04 +0100
Message-Id: <20201120114404.730-5-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120114404.730-1-kamil.dziezyk@arm.com>
References: <20201120114404.730-1-kamil.dziezyk@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0027.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::14) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO4P123CA0027.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:151::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 11:45:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7845112f-17a9-4e85-d847-08d88d49cfb1
X-MS-TrafficTypeDiagnostic: DBBPR08MB6284:|DBBPR08MB5914:
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB5914BF8C42F2371DBAE74F40FDFF0@DBBPR08MB5914.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:923;OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ByJiCRPwwunGA9BIk8ykEROyDJA++ra+PjOz/pNXNJM1FdUFr9Isixy07PGaS3MNujzUOBa2WVK6jqm5sxTVHXlOJRqhA8R8gGlhKqbR/SA4s9YSWMqNmpzrvKrh4lLIzv1i+5bX5lw4Evf59Kj3SObnGXrf/vd+K1uzMPRC6Sz50aw45YvpRvK/0pL/BQd1R4qhsTWaY8I8n9l3YJUbim3b9h9vGVjkvIPk+SmkmDLgNtPE47ZDKHWyOs3rRQwWctqkUP5jf+rYNw8U5T/NZg2uAbxBGG6VHVXUB0fY8RE2To8JNtlYscZZwiuUyXyJSJSYxwTt/avDRBDM9J6W+g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39850400004)(478600001)(44832011)(1076003)(6916009)(186003)(26005)(16526019)(8936002)(8676002)(2906002)(5660300002)(6486002)(66476007)(52116002)(7696005)(66556008)(4326008)(316002)(2616005)(86362001)(956004)(6666004)(36756003)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 fKGonZ6LJwfCLrivMTuxxrkuc5b8v9jc44jHCzhVEu+M75M8EP80PEommrBsQ5kefUNSiQnYYRB65NxE1mjXz6hpQIE1RHiNccY3OWKOUCDBJS9z/mEPu+8uFp5dsaMj/84FNfICFpr+iOqRzC4m4XFPzNCeBMfrdWLwM2We9U0Ya12npFotZB5Wg6ZqKE5b9exmCykfAEvbb8fz/8HxgZHXY/0SJ1xUMaWciiykovP0cLM4owcAJYIBe2zHpLxZ9BADTfgNzcRTe6nUxeGpyWqWDMXHymxm9TCz2AuIG3t3gpmWbM/T6R9umh1pGvoGxxv6YA4dvTMz/tak++lykwVH1Ud3dGdGumiKQ4zomFJsvGdiwbQQeCh9MEEN39LSEp4PIeQmwf8T+1cRGCEMD3JB2PPxP6WNpyS86m6kvUCmag7ZEyvEpl7j2Tl/kufzafhuLL47WFC7DwvkdhCDbf2FEOw7+x6U7QmAubyElT6QEYxmyGW1fDcIo8cpPpPKE21K1NkQKlUCYxOIKEv/b6v6cVuxXTITcM/8Ae0JOW4ae01HW1Ab0ZW4Z4H85cqqJ4pmPa/DI6HZH4VmTCpYqg2P598Sr+OajnGmsDTI2Q+u4EXuEljfJcN9cy6pJfxXVPqvYQ3daZDq33nMQFN3eMQ1ZddtZ2B+iAqtDI7MNVGeNlUVXc4s0dliGnCQnEJrbI7YWZZd5LqeWaMHTVq1tf26dBvclZnjZ/urCVREtLM67Bve4t3g5A1vRQ/wuhIy1CiRJCwfeQy3BGd5N3gVm9Y42JpzfXgHVlTGFOP3ajTpciZ1vr2espNIS3alHMNg/rv4ImCDYWf0sofl2nYM7LeKgPZSBP8d1IINSsCUfyqaTfb8GjrTjEAMvjjWms2JxNdcF5GsBFtH69VD8g0FKA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6284
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9157aa57-e998-4de8-6de4-08d88d49cc00
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+QbKKDnpy5xJCHEbDBpX/FEYklQjHlWJ1W4tV9p9T7fZ+KZ1gTkhi8bRmLzlQKXsFurc3owNw+KhA+vBiTh4gyOjpSoLGrKN7ORkrneuhtjmfQpXG6JnzsL3HDdMSWy/gULLzxtxpzY6lFs1feLl9CAiT3LxtKUlXH+Cq7pzt5Mz/q5Zi41aIjkiXeH19VdAy9zDqbcDKqwfiCXkYcDwF6PHqZJgjQw5SB3XFnAMMTNoqDvlSXWCsQy6uosGa/WVcqWK8ZKkRSjN6RrNUgLm9XZp/x2QzczVEBXdcmV/3Ol+0V33G9+OkfX2ohPYmVWcgTZkNjWukDRDbLo7AvHzVG3Dk4lsvgVZNuwvG/2q/KyU5V7RjOsbZKOzkBiGaY2zHx56/oQEs520vsCr3s3zLA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(376002)(136003)(46966005)(7696005)(5660300002)(70206006)(6486002)(36906005)(47076004)(70586007)(82740400003)(356005)(81166007)(956004)(316002)(4326008)(2616005)(36756003)(336012)(86362001)(6666004)(16526019)(186003)(1076003)(8936002)(44832011)(26005)(478600001)(6916009)(82310400003)(2906002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 11:45:42.9023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7845112f-17a9-4e85-d847-08d88d49cfb1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5914
Content-Type: text/plain

This patch brings following improvements:
 * Adding the same partition content e.g rootfs.tar.gz,
   for multiple partitions is now not possible.
 * Guest partition can contain only supported values of:
   - format types: vfat|ext2|ext3|ext4|swap|(empty)
   - image types: *.img.gz|*.img.bz2|*.img
                  *.tar.gz|*.tar.bz2|*.tar.xz|*.tar

Change-Id: I0201e7ef51830ac43fc59656fc496fcc1d13b8d4
Issue-Id: SCM-1515
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 .../xenguest/files/xenguest-mkimage           | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
index 8543c01..29e0911 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
@@ -436,11 +436,70 @@ disk_config_get_free_space() {
     echo -e "$((${disk_size::${#disk_size}-1} - ${disk_usage}))M"
 }
 
+disk_check_partition_format() {
+    local partformat="${1}"
+    # if partformat is not defined let's skip this check
+    [ -n "${partformat}" ] || return 0
+
+    case "${partformat}" in
+         vfat|ext2|ext3|ext4|swap)
+            ;;
+        *)
+            # invalid/unknown fstype
+            echo "Invalid file fstype ${partformat}"
+            exit 1
+            ;;
+    esac
+}
+
+disk_check_partition_content() {
+    local partcontent="${1}"
+    # if partcontent is not defined let's skip this check
+    [ -n "${partcontent}" ] || return 0
+
+    case "${partcontent}" in
+        *.img*)
+            case "${partcontent}" in
+                *.img.gz|*.img.bz2|*.img)
+                    ;;
+                *)
+                    # invalid/unknown compression type
+                    echo "Invalid file format in disk ${partcontent}"
+                    exit 1
+                    ;;
+            esac
+            ;;
+        *.tar*)
+            case "${partcontent}" in
+                *.tar.gz|*.tar.bz2|*.tar.xz|*.tar)
+                    ;;
+                *)
+                    # invalid/unknown tar type
+                    echo "Invalid file format in disk ${partcontent}"
+                    exit 1
+                    ;;
+            esac
+            ;;
+        *)
+          #invalid content type
+          echo "Unsupported content type ${partcontent}!"
+          exit 1
+          ;;
+    esac
+    # do not allow to create multiple partitions the same content
+    if grep ":${partcontent}\"" <<< "$(disk_config_get_parts)"; then
+        echo "Error ${partcontent} is already inside guest image"
+        exit 1
+    fi
+}
+
 disk_config_add_part() {
     partconf="${1}"
     partid=$(echo ${partconf} | sed -e "s/:.*//")
     partinfo=$(echo ${partconf} | sed -e "s/[^:]*://")
     partsize=$(echo ${partinfo} | cut -d ":" -f1)
+    partformat=$(echo ${partinfo} | cut -d ":" -f2)
+    partcontent=$(echo ${partinfo} | cut -d ":" -f3)
 
     # check size "ID:*SIZE*:FORMAT:CONTENT"
     partsizeMB=$(check_size "${partsize}")
@@ -459,6 +518,12 @@ disk_config_add_part() {
         exit 1
     fi
 
+    # check format "ID:SIZE:*FORMAT*:CONTENT"
+    disk_check_partition_format "${partformat}"
+
+    # check content "ID:SIZE:FORMAT:*CONTENT*"
+    disk_check_partition_content "${partcontent}"
+
     echo "DISK_PART${partid}=\"${partinfo}\"" >> \
         ${IMAGE_TMPDIR}/disk.cfg
 }
-- 
2.17.1

