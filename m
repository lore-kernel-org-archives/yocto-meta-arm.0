Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.82])
 by mx.groups.io with SMTP id smtpd.web10.6316.1587466160554772072
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Apr 2020 03:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yGt6aYuN;
 spf=pass (domain: arm.com, ip: 40.107.20.82, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sG4/tOIcMO48aBUoNEEOi4FStDE5bDrgkzW/2kp5ORY=;
 b=yGt6aYuN+frZujGcgt4pQdS2/a6OKxZTwIY4bGhV1Qjm+VFfgyiDVBU6TCqY95BzYhDMntMdU8DGuzQLDcGfUT9NdQTF08H2EHQtO466et9pX6wYlDgCx7IJXSBU6cR6hPpdVmqYxUPUZFkZyGMXqMc8fk+zypeHrq1GIwKO31E=
Received: from DB6PR0202CA0048.eurprd02.prod.outlook.com (2603:10a6:4:a5::34)
 by VE1PR08MB5037.eurprd08.prod.outlook.com (2603:10a6:803:110::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 10:49:18 +0000
Received: from DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::41) by DB6PR0202CA0048.outlook.office365.com
 (2603:10a6:4:a5::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.26 via Frontend
 Transport; Tue, 21 Apr 2020 10:49:18 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT024.mail.protection.outlook.com (10.152.20.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Tue, 21 Apr 2020 10:49:18 +0000
Received: ("Tessian outbound 29c24b8a1b7a:v53"); Tue, 21 Apr 2020 10:49:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 65d46e232a3c644a
X-CR-MTA-TID: 64aa7808
Received: from 19b4c0ad7a63.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A9052B86-4F8E-43EE-9D66-509D4672606A.1;
	Tue, 21 Apr 2020 10:49:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19b4c0ad7a63.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Apr 2020 10:49:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GiDN6zm7gB52Qu3eixCnip/XCavhllWxqe9fJrQyrDQQTZynWxiu3V04q6cV4MWMegTVGgLrCKBNQE/i01ZsltuXZJVtfPZ5Dq4JIFOt3Mgc7jijrEt8KGAWyXGwOAj0BwHSPimrP/0OIB24epJZ2TI5r99jD/aBpF2p6Z7q8tZX+PktfSBbWiwLMHNbfgwMmJ77qddVwwojUd/xHhxxXZEMxTkJhldPnjm3NFDC+g4GeIbRssYir/ob6MQ/LiPTfQUG6zmRq9eSUVbbGxk2bET2J+1P9e7gIJjDFHC4MTdakBBPx07kSuJgzF0N5wlPLxqr5DE4rVsPHE5GzEfFxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sG4/tOIcMO48aBUoNEEOi4FStDE5bDrgkzW/2kp5ORY=;
 b=XWgsxBU0pSUJ25egC0w/Oc9rTfj0kfq8a54H+qcch/VfoxjtfCWM52PN5yqZGJm8iKhAdKp7aMC73EHZUUTJIi5cwX2Wdm3nRsCTOHC0PEfsscNeRHDnKG8gn4xEM8nv+PbqPo0/ovSOvkPYNAV+0U/Tcacg4+vJ70Loq5HGz2nqBReoO5+mgq1F/TQpvUeRVpyfdBUf/6UFyZNi2oO+JT8EdxAX0oR1FwpfeTsVBNKwrghIdXSuklYD0N6U2/lBYFm+jsWm15hQ0tKUCfnqQYmA1o3G1Mp5p5559pHpJ0wpEdv6WnxfF8CLD65uK6h/uh9n7NdqczljZV41upfvgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sG4/tOIcMO48aBUoNEEOi4FStDE5bDrgkzW/2kp5ORY=;
 b=yGt6aYuN+frZujGcgt4pQdS2/a6OKxZTwIY4bGhV1Qjm+VFfgyiDVBU6TCqY95BzYhDMntMdU8DGuzQLDcGfUT9NdQTF08H2EHQtO466et9pX6wYlDgCx7IJXSBU6cR6hPpdVmqYxUPUZFkZyGMXqMc8fk+zypeHrq1GIwKO31E=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3914.eurprd08.prod.outlook.com (2603:10a6:10:32::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Tue, 21 Apr
 2020 10:49:10 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2921.027; Tue, 21 Apr 2020
 10:49:10 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm-autonomy: Fix circle dependency in xen-dtb
Date: Tue, 21 Apr 2020 11:48:55 +0100
Message-Id: <20200421104856.4389-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM5PR04CA0071.namprd04.prod.outlook.com
 (2603:10b6:3:ef::33) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.49) by DM5PR04CA0071.namprd04.prod.outlook.com (2603:10b6:3:ef::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend Transport; Tue, 21 Apr 2020 10:49:09 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0f1cec8b-aecf-44ac-8b68-08d7e5e1a429
X-MS-TrafficTypeDiagnostic: DB7PR08MB3914:|VE1PR08MB5037:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB50376D1D331886380DFB02EF9DD50@VE1PR08MB5037.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;OLM:1051;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(6666004)(8936002)(52116002)(36756003)(44832011)(5660300002)(7696005)(66946007)(66476007)(478600001)(6916009)(66556008)(86362001)(2906002)(8676002)(956004)(2616005)(6486002)(16526019)(26005)(186003)(4326008)(81156014)(316002)(1076003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 R/UUNVa6wuNlL5F4cW3PeJQGDOpQHVfFFfgiOw7SfTLjMi9dRl+xLkGuGhY8Zk24h9F9I076bw/J8xCQiLLjkjTGgVxcM4JRn40/HAVDQ5DMVH4+8PS+VAdXjpnzzkssn/T+IpFe4ohQPgZIAwrrb/39+XBhB7jjHyGSK2+44b4ZNsdjzVfwbW/t/Ujpt3sCxzWZIu2xNcUEnF92S54bUll5Ooh3qld86hOWf+CCHq8PWa7enzdxhBGK+DFYId123qesbCdW7MxYEB2kjG2ku4SXRS/fexJM7X/Rs51OrrSJFa4CEf8UIP3kRk1JNNLzaEtDftTC6l4bjE9Vm7xOdUAr2nFb30rh+UuPmoArlkuQrAPWbnpluPOAe96LQBSUMIhu6QpF2ZuOciDj9GYMOYZ0Gsc6+GTQBtOQWB5/sFf5HXn8dFXcgMjUInBIk66j
X-MS-Exchange-AntiSpam-MessageData: 
 /GimIR7jas1ndaJqY9VAizEz55iwPnx+nduPs7YXhD6x27vEMUPh7ZtGm5k4Agj9/yffgm7QjsellkvyQYCBEacPdLtixb9IOjaCDDsjlhLFsZGGZprUMINuKWZP178scbqc9/1WiqhJ5AOKJncd7Q==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3914
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(346002)(39860400002)(376002)(136003)(46966005)(316002)(26005)(7696005)(36756003)(356005)(478600001)(81166007)(82740400003)(47076004)(4326008)(70206006)(6486002)(16526019)(186003)(336012)(6916009)(8676002)(956004)(44832011)(2616005)(81156014)(6666004)(2906002)(5660300002)(1076003)(70586007)(8936002)(86362001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cd4427e8-95af-4d4d-a963-08d7e5e19f83
X-Forefront-PRVS: 038002787A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JY7xlYMRLXCVcb/ClJErOPnwpH/HKylk99Qkyb1QmCyHfurfaBl3f2j/QuLkU0tjv9mRpVa+gRBXoB6obsTPpFE6b1fUXTYC1dze+YycsTGBsSNppX/lz5bdpwWqwgqhbRvzmDsEN9k0DrL3NCg0z6cVIqn+rxHMHxB+pjMPyIRo37jXaasOL4ipuTz/qEATvdoFL0KGeLTKrJkCe9jNtAqMnVfK3zJOg5FT7LbKf7oN+EUWqeQmSkO4CpmR0LwNxk7DOU7TI/ZmglkSHbHTsjZTaktjIZmyAxUrwsbYC8a8n/1fFbh/SDumO/xQD3l51sduT4KMPQVYhumdb6oVWwt/UB8R4mAZa7B3YXRY2tVXEFgz9sXTAd3RWFz6Yi+FxI9j9NZC2GPnakWhCdYJKsR8MRywrLDekdlTBOVvRDLpccoNa0ogW1kfsjaLoHqroUEEqvbun+JRXb9NbaEV5AtlRp1zOFYS5zl/T/H4/x8BbHRP6l4xNl9wtjlxMEwSYmO5bGUyZ936r3GcUPnerg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 10:49:18.0662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1cec8b-aecf-44ac-8b68-08d7e5e1a429
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5037
Content-Type: text/plain

Solve circle dependency in xen-devicetree when initramfs is activated as
compile depends on kernel:do_deploy and xen-devicetree is needed to
create the arm-autonomy-host-image-minimal.
Move all actions in do_deploy so that only do_deploy depends on the
kernel do_deploy.

Change-Id: I011df8f225550afa71b18a88e0ebe01debca0bed
Issue-Id: SCM-949
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 .../xen-devicetree/xen-devicetree.bb          | 24 +++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
index 0bb9def..cef5f79 100644
--- a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
+++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
@@ -29,7 +29,14 @@ inherit nopackages deploy
 
 DEPENDS += "dtc-native"
 
-do_compile() {
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_install[noexec] = "1"
+
+do_deploy() {
+    if [ ! -f ${WORKDIR}/xen.dtsi.in ]; then
+        die "xen.dtsi.in does not exist"
+    fi
     cat ${WORKDIR}/xen.dtsi.in \
         | sed -e "s,###XEN_DOM0_BOOTARGS###,${XEN_DEVICETREE_DOM0_BOOTARGS}," \
         | sed -e "s,###XEN_XEN_BOOTARGS###,${XEN_DEVICETREE_XEN_BOOTARGS}," \
@@ -47,22 +54,19 @@ do_compile() {
 
         # Add external includes
         for inc in ${XEN_DEVICETREE_DTSI_MERGE}; do
+            if [ ! -f ${WORKDIR}/${inc} ]; then
+                die "Wrong file in XEN_DEVICETREE_DTSI_MERGE: ${WORKDIR}/${inc} does not exist"
+            fi
             echo "/include/ \"$inc\"" >> ${WORKDIR}/dom0-linux.dts
         done
 
         rdtbnoextn=`basename $dtbf ".dtb"`
         dtc -I dts -O dtb \
             -o ${WORKDIR}/${rdtbnoextn}-xen.dtb ${WORKDIR}/dom0-linux.dts
-    done
-}
-do_compile[depends] += "${XEN_DEVICETREE_DEPEND}"
-
-do_deploy() {
-    # install generated dtbs
-    for dtbf in ${XEN_DEVICETREE_DTBS}; do
-        rdtbnoextn=`basename $dtbf ".dtb"`
         install -m 644 ${rdtbnoextn}-xen.dtb ${DEPLOYDIR}/.
     done
 }
+do_deploy[depends] += "${XEN_DEVICETREE_DEPEND}"
+
+addtask deploy after do_install
 
-addtask deploy before do_build after do_compile
-- 
2.17.1

