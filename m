Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.82])
 by mx.groups.io with SMTP id smtpd.web12.8898.1585306517365203725
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 03:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=+FLLOwop;
 spf=pass (domain: arm.com, ip: 40.107.1.82, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0VMaGnHAmzKFdvBzcCL2789A2UuFi4SfGW9E2jj7ds=;
 b=+FLLOwopCM8kk4QAwszZn1Vhc9G+dhJFKiJqwLeYiE3moT1haAgWiuCgUFv8EI9H6MbUImykpCOPJx5EewCY6hE21xZwpXPlmGzAieqVCtw3q7COnRp5BCXv28hxyO2Q1ECo2IQZ/Pvb7IJ5mz3bRzbgldUiz4aVpcF9mpCoNoA=
Received: from VI1PR07CA0131.eurprd07.prod.outlook.com (2603:10a6:802:16::18)
 by VE1PR08MB4910.eurprd08.prod.outlook.com (2603:10a6:802:ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Fri, 27 Mar
 2020 10:55:14 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:802:16:cafe::af) by VI1PR07CA0131.outlook.office365.com
 (2603:10a6:802:16::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.9 via Frontend
 Transport; Fri, 27 Mar 2020 10:55:14 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 10:55:14 +0000
Received: ("Tessian outbound 60d769d68364:v48"); Fri, 27 Mar 2020 10:55:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3ee3124a0fd96153
X-CR-MTA-TID: 64aa7808
Received: from 6512e7e3484d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 75DD1715-0C9B-4D19-90C4-7B796679A13C.1;
	Fri, 27 Mar 2020 10:55:09 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6512e7e3484d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 10:55:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FzVYiNqoF+tMZiGWFgsxCRBETpE+XICKMXCy5rSdIq5QWp0C1MHKrUUjeymbbj/CwlKIpF737MIYxNfDDStHs2Wqh6HGdqIpU9z5+tQ9w8Pp3no7vlH4WsAt0MHO2K5xnTdviiepToCrVuooijbEpUvotxBDEOzaQqZWXoi7ewzn9bgCNk8dq9p3S5tQNao+GUHrNREl7Q6jCsPbGfdFGvLa4whlCbEnV51dC8UMITB4qqFcGDD6ZftqqFM7dm6QCiI4TyHYKjChgooCkaHnhow7SWxu3tkmEzcQTOCGaAwxPlwr/R/+j8Ju+FUB0R3disvVhy9dqjs5hePh6uUcxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0VMaGnHAmzKFdvBzcCL2789A2UuFi4SfGW9E2jj7ds=;
 b=Zmv6R2+sHWLouPEbREfja79LIQPv521CPjf6nfAcsrOdfi6rA9wQBVoanzM6s/WTLn6wFAP/MN6tjCnBE6+J7IVblFZqBk94bHrC4W9RRrB2h7l9Ro952Bwvh4IEG9rpCoAQky4S3Mv8npXQszfG0LNtX5OPN8K0txwiP1ta9tur3I/4vSulX7Ut6TwzqbhVM+ZB1no0u86PqbSXUIDEJdV8y5Y+2CzeN8fU7db9g5X+b32TjWzu1tncVK5r+oycZUB8UCfBJeDlcDSSPEeEYk0ExG0+zSQyOaO+4vg2cb9eYZRwk4xG3foYSt22EglwL+E4+x/f0f6FafZjbTw+ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0VMaGnHAmzKFdvBzcCL2789A2UuFi4SfGW9E2jj7ds=;
 b=+FLLOwopCM8kk4QAwszZn1Vhc9G+dhJFKiJqwLeYiE3moT1haAgWiuCgUFv8EI9H6MbUImykpCOPJx5EewCY6hE21xZwpXPlmGzAieqVCtw3q7COnRp5BCXv28hxyO2Q1ECo2IQZ/Pvb7IJ5mz3bRzbgldUiz4aVpcF9mpCoNoA=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3179.eurprd08.prod.outlook.com (52.135.130.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.18; Fri, 27 Mar 2020 10:55:07 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.025; Fri, 27 Mar 2020
 10:55:07 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com
Subject: [PATCH] arm-autonomy: Add external guests to host image
Date: Fri, 27 Mar 2020 10:54:53 +0000
Message-ID: <20200327105453.561-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN6PR04CA0081.namprd04.prod.outlook.com
 (2603:10b6:805:f2::22) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.51) by SN6PR04CA0081.namprd04.prod.outlook.com (2603:10b6:805:f2::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20 via Frontend Transport; Fri, 27 Mar 2020 10:55:06 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 162d822b-0771-4dc9-9c8e-08d7d23d544b
X-MS-TrafficTypeDiagnostic: DB7PR08MB3179:|VE1PR08MB4910:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB4910D27790A9FB3633F6EC079DCC0@VE1PR08MB4910.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(8676002)(44832011)(6486002)(4326008)(5660300002)(966005)(8936002)(186003)(6666004)(16526019)(26005)(956004)(316002)(2906002)(81166006)(36756003)(66946007)(81156014)(1076003)(478600001)(52116002)(66556008)(86362001)(7696005)(66476007)(6916009)(2616005);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: jeA7BUX5hP9rElO/0zwblJYEqkteeY3W+etUBP4W4WF8V0GsA25hKGPDb3jXgpCllY7dlOMM87UzNYgH4nIMAonxyJXh9OQnoVr9Sbh+GHqPX94hMPDwMUW8ERRpjt6UdQfaju00JTFnRyZ5J3JB+duMCRCzmhW+JesEUMw8lu1HQYCG2wb9+XL2tLLbUIIggxb9q6S9wD6Xub8Dg8/u0+uUnDANlFRSP1Oe3A97bFydTF/7BOjKDQxHrX2uintRCzzXrA4B+cVHeEIbNT1lxvQ0EzTHEfLxhpD6BY6cBVFf7xlQlqcxCVBYe5QvfBScQb2Xi8Rhg6TnNt8P1RfewN0yrS2Q0d82NipiPq03edk8GvUntvY81quuBBWbBBYLniEF30ZH9yIHq/oq11qAjqn6hhhRu2Kt4h9tcY2K/ROIX4YxJeuxdN+LG2dYxPGYL7IGQmkmlZK4umujY4l1S42Fj5dOMNiOpk0h1nQn+Xo//GY/SEPcnLF+W6AMGwcheXnNpMljwu5HR8eu3nlAhw==
X-MS-Exchange-AntiSpam-MessageData: g7KaSh4bfIh1bykJYwRZMA5tbXlXZxseE97DtOudkQEp+XKOPjSTiKjElw6JkcUHT3t7yK3pXzrmiIRu3nbGiLFXBivnxdhIE6R6qDCXHZVRgfdFsy8y+iyptb8dUJnu9NilbGt4+CeRwbdUyd1t9w==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3179
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966005)(44832011)(26826003)(478600001)(26005)(70586007)(356004)(6666004)(82740400003)(36906005)(966005)(316002)(47076004)(70206006)(6486002)(16526019)(1076003)(186003)(81166006)(2906002)(8676002)(6916009)(36756003)(8936002)(81156014)(7696005)(5660300002)(86362001)(336012)(2616005)(4326008)(956004);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	66b884de-0ff0-40e9-f7fa-08d7d23d5021
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JJdZ6RY22jE0ZoJNdLWGMpjsAMjISoKbAaP+G2LrT3OcRK70uVOT7WtSuRfJkVSot9GNZATIPaXR5eq7sPpUjuWyZQEz6S3dhSKYdqmffIC4GozyV7FP8EAKwn1U7GWhKwl5sTBk8S8+IbWzZm5PPzyIdcwc2tWSfeVSGLmrQerIt5JObH6adbDdSbZY9mrT9Nc5cI7y7Mr8wH7uGDyJSuc+qgmXtdMGN+YHeromYJ1QXyzki4UO+houkzOVWDVKO6Tmd18BDgIfsdOEGkFgHTQoqSjDXtOY+zNK6Zlta01oBiHNoyVj/7FsLHLdqLu1wvKc+AYg8+gHQI8dkE8Qx+o9ztNjBJ9K9a7YthaA2qKaP2+6BZciVXbJVSiOD7VUN9EkeikZnD6nr120LpKvjEjT16O1N4psS9S8QlfxoYFrfpGvXvp3T8whMfCDu79kYveoi+8iP9zPOigcDUgwKuKVtxilUEdGj/DPu12DZuc7FpEJYoAfFQz71fJzw94OMRP/+slZ/Y9OyYc4tGMoxPiM/zxEcrwK2vv5wLUHuvNshOyKdxe7GvDra38wkzZ/jaX102qh8Id/iMyTokg3ckc6hmmfdThzsBjxOMoQVzk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 10:55:14.4213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 162d822b-0771-4dc9-9c8e-08d7d23d544b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4910
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Add ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS variable to let user specifiy
a list of guests to be included directly in the host image.
The variable can be set to a space separated list of full path to
xenguest image files or SRC_URI compatible urls. Each entry can also
have a ';guestname=3DNAME' argument to set the destination name of the
guest added.

Change-Id: I4fc5e53df979b792ad930066a068ad1d4512c991
Issue-Id: SCM-767
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 .../images/arm-autonomy-host-image-minimal.bb | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-=
minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-=
minimal.bb
index 10c6e4b..978b58f 100644
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal=
.bb
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal=
.bb
@@ -5,6 +5,31 @@ DESCRIPTION =3D "Arm Autonomy stack host minimal image"
 inherit core-image
=20
 LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
+
+# The ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS variable can be used to includ=
e in the
+# image one or several xenguest images.
+# The list must be space separated and each entry must have the following
+# format: URL[;guestname=3DNAME]
+#  - URL can be the full path to a file or a Yocto compatible SRC_URI url
+#  - guestname=3DNAME can be used to specify the name of the guest. If not
+#    specified the basename of the file (without .xenguest extension) is u=
sed.
+#  Here are examples of values:
+#  /home/mydir/myguest.xenguest;guestname=3Dguest1
+#  http://www.url.com/testguest.xenguest
+#
+#  If you are using the output of an other Yocto project, you should use t=
he
+#  full path syntax instead of the Yocto SRC_URI to be able to use the
+#  symlink version of your image (as the real file has a new name on each
+#  build as it includes the date). You must not use SRC_URI type file:// a=
s
+#  it will try to include the symlink and not the destination file which w=
ill
+#  be detected by the recipe and output an error 'Guest file is a symlink'=
.
+#
+#  Guests can also be added using a bbapend to this recipe by adding entri=
es
+#  to SRC_URI with parameter ;guestname=3DNAME to specify the destination
+#  guestname. The parameter guestname must be present as it is used to det=
ect
+#  guests to be added
+ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS ??=3D ""
=20
 #=C2=A0Includes minimal set required to start and manage guest. The xen sp=
ecific
 # modules are not explicitly included as they are built as part of the ker=
nel
@@ -29,4 +54,64 @@ python __anonymous() {
=20
     if bb.utils.contains('DISTRO_FEATURES', 'xen', False, True, d):
         raise bb.parse.SkipRecipe("DISTRO_FEATURES does not contain 'xen'"=
)
+
+    # Check in ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS for extra guests and =
add them
+    # to SRC_URI with xenguest parameter if not set
+    guestlist =3D d.getVar('ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS')
+    if guestlist:
+        for guest in guestlist.split():
+            # If the user just specified a file instead of file://FILE, ad=
d
+            # the file:// prefix
+            if guest.startswith('/'):
+                guestfile =3D ''
+                guestname =3D ''
+                if ';guestname=3D' in guest:
+                    # user specified a guestname
+                    guestname =3D guest.split(';guestname=3D')[1]
+                    guestfile =3D guest.split(';guestname=3D')[0]
+                else:
+                    # no guestname so use the basename
+                    guestname =3D os.path.basename(guest)
+                    guestfile =3D guest
+                # in case we have a link we need the destination
+                guestfile =3D os.path.realpath(guestfile)
+
+                # make sure the file exist to give a meaningfull error
+                if not os.path.exists(guestfile):
+                    raise bb.parse.SkipRecipe("ARM_AUTONOMY_HOST_IMAGE_EXT=
ERN_GUESTS entry does not exist: " + guest)
+
+                # In case the file is a symlink make sure we use the desti=
nation
+                d.appendVar('SRC_URI',  ' file://' + guestfile + ';guestna=
me=3D' + guestname)
+            else:
+                # we have a Yocto URL
+                try:
+                    _, _, path, _, _, parm =3D bb.fetch.decodeurl(guest)
+                    # force guestname param in if not already there
+                    if not 'guestname' in parm:
+                        guest  +=3D ';guestname=3D' + os.path.basename(pat=
h)
+                    d.appendVar('SRC_URI', ' ' + guest)
+                except:
+                    raise bb.parse.SkipRecipe("ARM_AUTONOMY_HOST_IMAGE_EXT=
ERN_GUESTS contains an invalid entry: " + guest)
 }
+
+python add_extern_guests () {
+    # Destination directory on the rootfs
+    guestdir =3D d.getVar('IMAGE_ROOTFS') + d.getVar('datadir') + '/guests=
'
+
+    # Parse SRC_URI for files with ;guestname=3D parameter
+    src_uri =3D d.getVar('SRC_URI')
+    for entry in src_uri.split():
+        _, _, path, _, _, parm =3D bb.fetch.decodeurl(entry)
+        if 'guestname' in parm:
+            if os.path.islink(path):
+                bb.fatal("Guest file is a symlink: " + path)
+            bb.utils.mkdirhier(guestdir)
+            dstname =3D parm['guestname']
+            # Add file extension if not there
+            if not dstname.endswith('.xenguest'):
+                dstname +=3D '.xenguest'
+            bb.utils.copyfile(path, guestdir + '/' + dstname)
+}
+
+IMAGE_PREPROCESS_COMMAND +=3D "add_extern_guests; "
+
--=20
2.17.1

