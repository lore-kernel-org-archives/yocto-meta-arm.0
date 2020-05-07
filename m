Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.43])
 by mx.groups.io with SMTP id smtpd.web10.3053.1588845685374988584
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 May 2020 03:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=W+AqWkZw;
 spf=pass (domain: arm.com, ip: 40.107.6.43, mailfrom: vineeth.raveendran@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h84ka6AVWe6yhf+SRMRLV958HNuoNSbFgI5RDTES3qw=;
 b=W+AqWkZwCnDsZlSwmqdvs9jpcoW4SAkSIC/+B31CMMOQKgtxMtGyShe7uQmOEgkzGtJUQDb1YwSfl5WYzvGutNdHPmqejgvqkO3WWMTrpPbFj86dvre20t6VvOzRJT/Hq0D8EgwhiHRu5hSP7CZ674ymE4zwPL9kySzrFy+n/O0=
Received: from AM5PR0701CA0009.eurprd07.prod.outlook.com
 (2603:10a6:203:51::19) by DB6PR0801MB1687.eurprd08.prod.outlook.com
 (2603:10a6:4:39::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Thu, 7 May
 2020 10:01:21 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::ba) by AM5PR0701CA0009.outlook.office365.com
 (2603:10a6:203:51::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.11 via Frontend
 Transport; Thu, 7 May 2020 10:01:21 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 10:01:20 +0000
Received: ("Tessian outbound e88319d7ccd0:v54"); Thu, 07 May 2020 10:01:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a9fcd2d667c73278
X-CR-MTA-TID: 64aa7808
Received: from e4a79daa98b4.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 439FD670-A70C-4822-976B-B866A11C86E4.1;
	Thu, 07 May 2020 10:01:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e4a79daa98b4.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 May 2020 10:01:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUd5/xDGTbGFFMhAyujBKjDn4OcKO12idLiytjJ08O+eZ69+UyZKlmzKFcrTy5N3UVDFNEOLSKBquwxHgAP2VPDEf83+Zt4DqIObPZ+jCpphRX8kvw+rYAOtowksdpiCFR/1htQIOmmAd86+/LSH1MpYu8BdJBqtXG7pWXJef3xYGbMI7G2t7fpyU4/8H9CbwPaG0qjHpWw9X++SlDlPx9cw6HKhi21IfAUgFqJY50Kj+J/PrBULuRttMFUb7sTRQ+vRh6dc2+kGedNyOSnZg1PPIJDD4YclksvS16DdZUsN3sNj5WFCaJsnd5aEmk29vIVztewcwAEfqqbfOvz7VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h84ka6AVWe6yhf+SRMRLV958HNuoNSbFgI5RDTES3qw=;
 b=ATPHbGJM2278XzaLNCqQzrWdgaDFHt2XH4VXljXbSrFyw3VHPKo/h2rVcC6NM3ItHauuOB3xc05xLvfEMjXfQ2t4sL8VOzzSBh8G9cnE6WL6Z3uLF37c+G7V5r0FvYPfJa2lW/bI/QBkRjmH83rb+9Jd1RYLftkQEG4vcF3hEjCxofqRg/YXnRgUYUzjnupInkIrhpH7YSSwHpPQ7RJ1YYZIz6xsy4F5Fnnds3/PnQdA0s+AHpBbcWm+G36EOTE+YbPxe/5LIlSY5KQ+wMO3Og4YpNjMxBI20rCQGAoJhLf7h1MfL0lREnw6GFnfyAxTFVQqHYBQ8hCA6s8P/iy8EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h84ka6AVWe6yhf+SRMRLV958HNuoNSbFgI5RDTES3qw=;
 b=W+AqWkZwCnDsZlSwmqdvs9jpcoW4SAkSIC/+B31CMMOQKgtxMtGyShe7uQmOEgkzGtJUQDb1YwSfl5WYzvGutNdHPmqejgvqkO3WWMTrpPbFj86dvre20t6VvOzRJT/Hq0D8EgwhiHRu5hSP7CZ674ymE4zwPL9kySzrFy+n/O0=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com (2603:10a6:803:bf::19)
 by VI1PR08MB5343.eurprd08.prod.outlook.com (2603:10a6:803:12d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Thu, 7 May
 2020 10:01:14 +0000
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::e106:3936:4db6:627c]) by VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::e106:3936:4db6:627c%3]) with mapi id 15.20.2958.034; Thu, 7 May 2020
 10:01:14 +0000
From: "Vineeth Raveendran" <vineeth.raveendran@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH 2/2] [arm-autonomy] Move to dunfell
Date: Thu,  7 May 2020 11:00:54 +0100
Message-ID: <20200507100054.25199-3-vineeth.raveendran@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507100054.25199-1-vineeth.raveendran@arm.com>
References: <20200507100054.25199-1-vineeth.raveendran@arm.com>
X-ClientProxiedBy: SN4PR0501CA0077.namprd05.prod.outlook.com
 (2603:10b6:803:22::15) To VI1PR08MB3696.eurprd08.prod.outlook.com
 (2603:10a6:803:bf::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123640.arm.com (217.140.99.251) by SN4PR0501CA0077.namprd05.prod.outlook.com (2603:10b6:803:22::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.11 via Frontend Transport; Thu, 7 May 2020 10:01:12 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c6989bd8-e9ca-483a-a947-08d7f26d97ec
X-MS-TrafficTypeDiagnostic: VI1PR08MB5343:|VI1PR08MB5343:|DB6PR0801MB1687:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB1687803A2406204A8F42F7F89AA50@DB6PR0801MB1687.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;OLM:1227;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JZqgxO27b++wqgBVTJ350TkNrC3ZTNeRPNYlq+JbO4NEJHT6kfTLct3xQ+4sGgACnbosb4ZPUf9Lwk70TBW1pTikvYZ0E5C9clyiI0I6FBHSJft8HYkWfjTTSpbcWYjet/tA4EQTT4vEaw+rOTJ0z6eNsRm9myhGa7wdtTzNTB5IAWbuzgWXyt/4vDMJ2WaLZtXy6ScoDUZ0cxQ8GMJUu/Q83BW7d/ZN5FSERwD3pl8r9+q67GSu5E0hlT1mRU10uHJQrGly7MVZ1M5bqyB8duJC0g2sGdmSZA4QVU9S+1H4YgZobx4+h+p/VfPwZOpLPMWHufPRk9KlouJ1cgjZ0Wfrj8Hgf+zoYB+xmt0GhI6IEs4pVRqHGnlEbUDlvJgsVy1ZwTxesT0HAx8HSzW5uE2cMyTeFnrYLyuxg+a+evAfdJ18rMWvP9l9DqzRzMhm2+4PiSXc5BjrwJeqxfJNRfXfJ0Qu7PCrDbcS15W5cUaBCM4XzCtnKl45xgQui+1ItdwIOjzarPinRC6aSFWLXA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(33430700001)(316002)(33440700001)(52116002)(6666004)(6916009)(36756003)(66574014)(83310400001)(83300400001)(4326008)(6486002)(5660300002)(83280400001)(83320400001)(83290400001)(1076003)(66946007)(66476007)(66556008)(478600001)(956004)(2616005)(44832011)(16526019)(8936002)(186003)(7696005)(86362001)(26005)(8676002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: PrC4RlHseREpGaUmNFe8inljXFDHwrIosCEf9L8z9cyQQQk6T13KTyMfJRB31p8Xbe4hFVzGjCmlu2bN600sl1yZEUtVWXC0HQxKgoWn/7gHMwkJ1iZx9F0E0fM3jaKOOjCLQxTYaE894mqb51Ey0DIZe/nmicago9yt/PYwv+6zTMPOKtuFcWHQa7egAZ3RIesIfMVLYI/vR+WonjqDsmjRMd957XapuZhzk49iyDUjowxuNfKhhJQa2wxYvIu1/qc2z+Oyx7Wff+2hUvOkJ916HdmIiCupsApYR+Wdt7FcuTY7fd4lSTvsJ0KuvtnhvKk4u65KqCMbbwQYF50AyfMcp9cwHFhWztB5CWw2TOvxcNd7a9T85/qcqtOJydqUE+XlMrfb7IF49pA5YziH7dCTzLQCVqsjbOtcaJuU5vAS8kYoNprVHDNZt9mKtx1710Slyzm1LsWmnaNpoLWE8eUxrDbX3XLkS64/Ug7KVEBx1852r8AsAKnDUCgssLNDS7pvaJsfR/qR929s44R7OAgbs/0DFsnGiprnEdwmT3NTEsAB+gvMg5GuEWtRw+FnSJRcH6tDdVvYDN2jP1+wGMNGzokZ7ZFcfVmjzH69C77faUr3Vbeuf5sTvRVeEhcGOVvpvdyhG9OzlOtckddB0wJHEE2+nIZGWkz0zIYhrXusrx6e8v3tGwxDoaW4xFNy7PASiVNL7jcMK6V9XnX77iAgijXuukxqfIC7lzPhcuY9dgE3FUrFd3AMDN/aBQDSCdHg66V7vg1NBSzssVz2XVEG8NO/RN8RGqVQQCWKhxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5343
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Vineeth.Raveendran@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(46966005)(33430700001)(81166007)(478600001)(2616005)(956004)(356005)(44832011)(47076004)(82310400002)(7696005)(82740400003)(6666004)(1076003)(6486002)(4326008)(2906002)(6916009)(86362001)(336012)(36906005)(5660300002)(70586007)(70206006)(316002)(26005)(8936002)(16526019)(36756003)(186003)(66574014)(33440700001)(8676002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0b3029b9-ecdf-451a-5228-08d7f26d9382
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S5w61FiF5yyU5ppi0uh7oYhlkQ7ex6oI6HYIdvJjNxC8ixiz/vheSBfV3E+6hCLnUBBJLUj+R5lemd3n+TBFfoIkO64m8sPBXJUgyoX5ejiIm7dUrhp2XeHr2nqFeGCZwiw9JOOsN2vhqaUEPOpF7Bqs5QMjfjeL/DxsbAFd1m2MAGihGekwUGPDrl40kz8lHEeaqQLKnEMboIpcAOI13hdmHCBtZxCENdIYcNdq3dAOPW9v9gdWFIDRCxZgdj/8yl3kflKG6A0aCaeCGhCJYZDRwjWCxRt9tdHIevVH26qeJRqqQjaWKsUUwLPPDRGw3p8/NPbC2BCS/8ikrZ8NSlCPRECWObQuqvR7CBdE1GucTR1/jmw1HCu4INuFRYxg5DnXzjf0504M8+T539rEuhP5SthUScD4Gz3UA6klYKJ/Ejmp1wLKnWlZaQsJ8C3pXFyU+oTZmVBrmnO+l6c4m9RPCeKK/7zZXVaVns9CK6CdAMWQN8UiVWh6uP/b/DuhT9AZKiedKz2O9U/7n+gS3TRwL4T11drozfKeBl9JteIDZA/6TaIAbGTkFz4Liml8RTO85Y/D2qW+DBzsNTvkHQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 10:01:20.9641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6989bd8-e9ca-483a-a947-08d7f26d97ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1687
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- make xenguest-manage rdepend on xen-tools to adapt to recipe
modifications in meta-virtualization
- add xen to IMAGE_EXTRADEPENDS to build xen binary when build
autonomy-host-image
- switch arm64-autonomy-machine to use Linux 5.4
- remove trace patch for xen as meta-virtualization is now using a xen
release which has this fixed
- rework xen bbappends to adapt to changes done in xen recipes

Change-Id: I439bde0df2c0a16f529436b65f1a96af5a2981af
Issue-Id: SCM-833
Signed-off-by: Vineeth Raveendran <vineeth.raveendran@arm.com>
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 meta-arm-autonomy/conf/layer.conf             |  2 +-
 .../conf/machine/arm64-autonomy-guest.conf    |  2 +-
 .../images/arm-autonomy-host-image-minimal.bb |  4 +-
 .../0001-trace-fix-build-with-gcc9.patch      | 56 -------------------
 ...e-number-of-interrupt-lines-for-dom0.patch |  0
 .../xen/{xen_4.%.bbappend =3D> xen_%.bbappend}  |  4 ++
 .../recipes-extended/xen/xen_4.12.0.bbappend  | 10 ----
 .../xenguest/xenguest-manager.bb              |  2 +-
 8 files changed, 10 insertions(+), 70 deletions(-)
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen/files/4.12.0/000=
1-trace-fix-build-with-gcc9.patch
 rename meta-arm-autonomy/recipes-extended/xen/files/{4.12.0 =3D> 4.12}/000=
1-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch (100%)
 rename meta-arm-autonomy/recipes-extended/xen/{xen_4.%.bbappend =3D> xen_%=
.bbappend} (83%)
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen_4.12.0.bbapp=
end

diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/lay=
er.conf
index 8ee9ce6..739dc81 100644
--- a/meta-arm-autonomy/conf/layer.conf
+++ b/meta-arm-autonomy/conf/layer.conf
@@ -16,7 +16,7 @@ LAYERDEPENDS_meta-arm-autonomy =3D " \
    openembedded-layer \
    virtualization-layer \
 "
-LAYERSERIES_COMPAT_meta-arm-autonomy =3D "zeus"
+LAYERSERIES_COMPAT_meta-arm-autonomy =3D "dunfell"
=20
 # We don't activate virtualization feature from meta-virtualization as it
 # brings in lots of stuff we don't need. We need to disable the sanity che=
ck
diff --git a/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf b/met=
a-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
index cb72c60..8b32fa7 100644
--- a/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
+++ b/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
@@ -11,7 +11,7 @@ KERNEL_IMAGETYPE =3D "Image"
 IMAGE_FSTYPES +=3D "tar.bz2"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "4.19%"
+PREFERRED_VERSION_linux-yocto ?=3D "5.4%"
=20
 DISTRO_FEATURES +=3D "arm-autonomy-guest"
=20
diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-=
minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-=
minimal.bb
index 978b58f..d586110 100644
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal=
.bb
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal=
.bb
@@ -39,12 +39,14 @@ IMAGE_INSTALL +=3D " \
     packagegroup-core-boot \
     packagegroup-core-ssh-openssh \
     kernel-modules \
-    xen-base \
     qemu \
     xenguest-manager \
     xenguest-network-bridge \
     "
=20
+# Build xen binary
+EXTRA_IMAGEDEPENDS +=3D "xen"
+
 # Build xen-devicetree to produce a xen ready devicetree
 EXTRA_IMAGEDEPENDS +=3D "xen-devicetree"
=20
diff --git a/meta-arm-autonomy/recipes-extended/xen/files/4.12.0/0001-trace=
-fix-build-with-gcc9.patch b/meta-arm-autonomy/recipes-extended/xen/files/4=
.12.0/0001-trace-fix-build-with-gcc9.patch
deleted file mode 100644
index 8ecc904..0000000
--- a/meta-arm-autonomy/recipes-extended/xen/files/4.12.0/0001-trace-fix-bu=
ild-with-gcc9.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 0dcd945a675cd12d283121e9b7f1626104b60bcc Mon Sep 17 00:00:00 2001
-From: Jan Beulich <jbeulich@suse.com>
-Date: Tue, 4 Jun 2019 15:32:55 +0200
-Subject: [PATCH] trace: fix build with gcc9
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-While I've not observed this myself, gcc 9 (imo validly) reportedly may
-complain
-
-trace.c: In function '__trace_hypercall':
-trace.c:826:19: error: taking address of packed member of 'struct <anonymo=
us>' may result in an unaligned pointer value [-Werror=3Daddress-of-packed-=
member]
-  826 |     uint32_t *a =3D d.args;
-
-and the fix is rather simple - remove the __packed attribute. Introduce
-a BUILD_BUG_ON() as replacement, for the unlikely case that Xen might
-get ported to an architecture where array alignment higher that that of
-its elements.
-
-Reported-by: Martin Li=C5=A1ka <martin.liska@suse.com>
-Signed-off-by: Jan Beulich <jbeulich@suse.com>
-Acked-by: George Dunlap <george.dunlap@citrix.com>
-master commit: 3fd3b266d4198c06e8e421ca515d9ba09ccd5155
-master date: 2019-05-13 09:51:23 +0200
----
- xen/common/trace.c | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/xen/common/trace.c b/xen/common/trace.c
-index cc294fc384..d1ef81407b 100644
---- a/xen/common/trace.c
-+++ b/xen/common/trace.c
-@@ -819,12 +819,18 @@ unlock:
- void __trace_hypercall(uint32_t event, unsigned long op,
-                        const xen_ulong_t *args)
- {
--    struct __packed {
-+    struct {
-         uint32_t op;
-         uint32_t args[6];
-     } d;
-     uint32_t *a =3D d.args;
-=20
-+    /*
-+     * In lieu of using __packed above, which gcc9 legitimately doesn't
-+     * like in combination with the address of d.args[] taken.
-+     */
-+    BUILD_BUG_ON(offsetof(typeof(d), args) !=3D sizeof(d.op));
-+
- #define APPEND_ARG32(i)                         \
-     do {                                        \
-         unsigned i_ =3D (i);                      \
---=20
-2.17.1
-
diff --git a/meta-arm-autonomy/recipes-extended/xen/files/4.12.0/0001-xen-a=
rm-Cap-the-number-of-interrupt-lines-for-dom0.patch b/meta-arm-autonomy/rec=
ipes-extended/xen/files/4.12/0001-xen-arm-Cap-the-number-of-interrupt-lines=
-for-dom0.patch
similarity index 100%
rename from meta-arm-autonomy/recipes-extended/xen/files/4.12.0/0001-xen-ar=
m-Cap-the-number-of-interrupt-lines-for-dom0.patch
rename to meta-arm-autonomy/recipes-extended/xen/files/4.12/0001-xen-arm-Ca=
p-the-number-of-interrupt-lines-for-dom0.patch
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_4.%.bbappend b/meta=
-arm-autonomy/recipes-extended/xen/xen_%.bbappend
similarity index 83%
rename from meta-arm-autonomy/recipes-extended/xen/xen_4.%.bbappend
rename to meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
index e7ddce9..fb5962a 100644
--- a/meta-arm-autonomy/recipes-extended/xen/xen_4.%.bbappend
+++ b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
@@ -31,3 +31,7 @@ SRC_URI_append_fvp-base =3D " file://fvp/defconfig"
 COMPATIBLE_MACHINE_juno =3D "juno"
=20
 SRC_URI_append_juno =3D " file://juno/defconfig"
+
+# Gem5 support
+# Fix problem with number of interrupts on gem5
+SRC_URI_append_gem5-arm64 =3D " file://${XEN_REL}/0001-xen-arm-Cap-the-num=
ber-of-interrupt-lines-for-dom0.patch"
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_4.12.0.bbappend b/m=
eta-arm-autonomy/recipes-extended/xen/xen_4.12.0.bbappend
deleted file mode 100644
index 87b1f63..0000000
--- a/meta-arm-autonomy/recipes-extended/xen/xen_4.12.0.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-# xen version specific patch information
-
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
-
-# Solve trace.c compilation error on 4.12.0
-# This should only be applied for 4.12.0 (solved in greater versions)
-SRC_URI +=3D "file://4.12.0/0001-trace-fix-build-with-gcc9.patch"
-
-# Fix problem with number of interrupts on gem5
-SRC_URI_append_gem5-arm64 =3D " file://4.12.0/0001-xen-arm-Cap-the-number-=
of-interrupt-lines-for-dom0.patch"
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.b=
b b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
index 9affae9..65925d2 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
@@ -46,7 +46,7 @@ do_install() {
 }
=20
 # Things that we need on the target
-RDEPENDS_${PN} +=3D "bash tar xenguest-mkimage lvm2 xen-xl parted e2fsprog=
s"
+RDEPENDS_${PN} +=3D "bash tar xenguest-mkimage lvm2 xen-tools parted e2fsp=
rogs"
=20
 FILES_${PN} +=3D "${bindir}/xenguest-manager \
                ${sysconfdir}/xenguest"
--=20
2.17.1

