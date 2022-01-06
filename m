Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82107C433EF
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 11:01:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7086.1641466871530495473
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Jan 2022 03:01:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3DA711D4
	for <meta-arm@lists.yoctoproject.org>; Thu,  6 Jan 2022 03:01:04 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 031DD3F774
	for <meta-arm@lists.yoctoproject.org>; Thu,  6 Jan 2022 03:01:03 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-toolchain/armcompiler: upgrade to 6.17
Date: Thu,  6 Jan 2022 11:01:00 +0000
Message-Id: <20220106110101.643678-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Jan 2022 11:01:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2803

Upgrade to the latest release, now based on Clang 14.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../Armcompiler-License-agreement             | 201 +++++++++---------
 .../Armcompiler-Redistributables              |  26 +--
 .../Armcompiler-Supplementary-terms           |   4 +-
 .../Armcompiler-Third-party-licenses          |  98 +++------
 ...rmcompiler_6.16.bb =3D> armcompiler_6.17.bb} |  10 +-
 5 files changed, 156 insertions(+), 183 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{armcomp=
iler_6.16.bb =3D> armcompiler_6.17.bb} (89%)

diff --git a/meta-arm-toolchain/custom-licenses/Armcompiler-License-agreeme=
nt b/meta-arm-toolchain/custom-licenses/Armcompiler-License-agreement
index 9861f00c..99bac868 100644
--- a/meta-arm-toolchain/custom-licenses/Armcompiler-License-agreement
+++ b/meta-arm-toolchain/custom-licenses/Armcompiler-License-agreement
@@ -1,165 +1,174 @@
-END USER LICENSE AGREEMENT FOR ARM SOFTWARE DEVELOPMENT TOOLS
+                END USER LICENSE AGREEMENT FOR ARM SOFTWARE DEVELOPMENT TO=
OLS
=20
 This end user license agreement ("License") is a legal agreement between y=
ou (a single individual), or the company or organisation (a single legal en=
tity) that you represent and have the legal authority to bind, and Arm rela=
ting to use of the Arm Tools. Arm is only willing to license the Arm Tools =
on condition that you accept all of the terms of this License. By clicking =
"I Agree" or by installing or otherwise using the Arm Tools and/or any Upda=
te thereto (as permitted by this License) you indicate that you agree to be=
 bound by all of the terms and conditions of this License. If you do not ag=
ree to the terms of this License, Arm will NOT license the Arm Tools to you=
, you may not install or use the Arm Tools or any part thereof, and you sha=
ll promptly return the Arm Tools to Arm or to your supplier (if not Arm) an=
d ask for a refund of the license fee paid (if any).
=20
 NOTE - YOUR ATTENTION IS DRAWN TO THE FOLLOWING:
=20
-(A) The terms and conditions set out in this License shall apply to the su=
pply by Arm of Arm Tools for both commercial and non-commercial use. If you=
 are in receipt of a Non-Commercial Use License for the Arm Tools (each cap=
italised term as defined below), or the Arm Tools or any component thereof =
are identified or classified as such, or you are receiving a license for th=
e Arm Tools free of charge, then notwithstanding any of the other terms and=
 conditions of this License, your use of the Arm Tools shall be limited by =
the restrictions of use set out in clause 2.2 of this License.
+(A)     The terms and conditions set out in this License shall apply to th=
e supply by Arm of Arm Tools for both commercial and non-commercial use. If=
 you are in receipt of a Non-Commercial Use License for the Arm Tools (each=
 capitalised term as defined below), or the Arm Tools or any component ther=
eof are identified or classified as such, or you are receiving a license fo=
r the Arm Tools free of charge, then notwithstanding any of the other terms=
 and conditions of this License, your use of the Arm Tools shall be limited=
 by the restrictions of use set out in clause 3 of this License.
=20
-(B) PLEASE NOTE any terms and conditions of use set out in the order docum=
entation provided to you by Arm and the Software Information File(s) (as de=
fined below) applicable to the Arm Tools provided to you with (or included =
within) either (i) the Arm Tools, and/or (ii) any Updates to the Arm Tools,=
 which limit, extend or otherwise vary the permitted uses and restrictions =
applicable to the Arm Tools ("Special Conditions"). The Special Conditions =
form part of and are incorporated into this License. In the event of any co=
nflict or inconsistency between the provisions set out in the main body of =
this License and any of the Special Conditions, the provisions set out in t=
he Special Conditions shall prevail (in the order in which they are listed =
in this paragraph).
+(B)     PLEASE NOTE any terms and conditions of use set out in the order d=
ocumentation provided to you by Arm and the Software Information File(s) (a=
s defined below) applicable to the Arm Tools provided to you with (or inclu=
ded within) either (i) the Arm Tools, and/or (ii) any Updates to the Arm To=
ols, which limit, extend or otherwise vary the permitted uses and restricti=
ons applicable to the Arm Tools ("Special Conditions"). The Special Conditi=
ons form part of and are incorporated into this License. In the event of an=
y conflict or inconsistency between the provisions set out in the main body=
 of this License and any of the Special Conditions, the provisions set out =
in the Special Conditions shall prevail (in the order in which they are lis=
ted in this paragraph).
=20
-(C) This License (and any documents incorporated by reference herein) is t=
he sole and exclusive agreement between you and Arm for the Arm Tools, and =
(except as agreed in writing to the contrary) no other document, including =
(but not limited to) your purchase order or any other document supplied by =
you, will form part of this License.
+(C)     This License (and any documents incorporated by reference herein) =
is the sole and exclusive agreement between you and Arm for the Arm Tools, =
and (except as agreed in writing to the contrary) no other document, includ=
ing (but not limited to) your purchase order or any other document supplied=
 by you, will form part of this License.
=20
-DEFINITIONS
+1. DEFINITIONS
 For the purposes of this License the following words and expressions shall=
 have the following meanings:
 "Arm" means Arm Limited whose registered office is situated at 110 Fulbour=
n Road, Cambridge CB1 9NJ, England and/or any member of Arm's group of comp=
anies.
-"Arm Documentation" means any printed, electronic or online documentation =
relating to Arm Software licensed to you by Arm under this License.
-"Arm Software" means any and all software, firmware and data licensed to y=
ou by Arm under this License.
-"Arm Tools" means any and all Arm Software and/or Arm Documentation owned =
or licensed by Arm, and any Updates to the Arm Software and/or Arm Document=
ation.
-"Arm Tools Performance Data" means any results, benchmarking data or other=
 information relating to or connected with your use or testing of the Arm T=
ools which are indicative of their performance, efficacy, reliability or qu=
ality.
+"Arm Documentation" means any printed, electronic or online documentation =
owned or licensed by Arm that relates to the Arm Software.
+"Arm Software" means any software, firmware and data owned or licensed by =
Arm.
+"Arm Tools" means the Arm Software and/or Arm Documentation (including any=
 Updates to the Arm Software and/or Arm Documentation) licensed to you by A=
rm under this License.
+"Arm Tools Performance Data" means any results, benchmarking data or other=
 information relating to or connected with your use or testing of Arm Tools=
 which is indicative of their performance, efficacy, reliability or quality.
 "Fees" means any fee(s) payable by you for the provision by Arm to you of =
the Arm Tools and associated support and maintenance services, and any othe=
r fees payable by you in accordance with this License that are agreed by th=
e parties from time to time.
 "License Key" means an electronic license key issued to you by Arm which e=
nables you to use and run one or more Licensed Seat of an Arm Tool or a com=
ponent thereof in accordance with the terms of this License.
-"Licensed Seats" means any and all Seats of the Arm Tools (including, if a=
pplicable, Updates) that you are licensed to run and use concurrently under=
 the terms of this License, in the types and quantities specified in the or=
der documentation provided to you by Arm, as well as any additional or repl=
acement Seats of the Arm Tools that Arm agrees to provide to you from time =
to time during the License Term.
+"Licensed Seats" means any and all Seats of the Arm Tools (including, if a=
pplicable, Updates) that you are licensed to run and use concurrently under=
 the terms of this License, in the types and quantities specified (if appli=
cable) in the order documentation provided to you by Arm, as well as any ad=
ditional or replacement Seats of the Arm Tools that Arm provides to you fro=
m time to time during the License Term (For the purposes of this definition=
, "Seat" meaning a written or electronic authorisation to run a software co=
mponent subject to the terms and restrictions specified in that authorisati=
on).
 "License Term" means the term set out in the order documentation provided =
to you by Arm during which you shall be entitled to access and use the Arm =
Tools.
 "Non-Commercial Use License" means an evaluation, preview, beta, pre-relea=
se, pilot, academic, educational or community use only license.
 "Permitted Users" means your employees, workers, consultants, professional=
 advisors, bona fide sub-contractors and service providers that use the Arm=
 Tools in connection with the provision of work carried out for your benefi=
t, and/or, other members of your organisation or third party users who use =
the Arm Tools with your express written permission on computers (physical o=
r virtual) owned or controlled by you.
-"Redistributables" means the example code, library files, configuration fi=
les, header files, and any other Arm Tools or components thereof owned by A=
rm (or licensed by Arm and provided to you under Arm's terms and conditions=
) which you are permitted to include within Your Software and redistribute =
or sub-license within Your Software to third parties, the details of which =
(if applicable) are set out in a file or folder (the "Redistributables File=
") typically named 'redistributables' located within an Arm Tool (or compon=
ents thereof).
-"Seat" means a written or electronic authorisation to run a software compo=
nent subject to the terms and restrictions specified in that authorisation.
+"Redistributables" means the example code, library files, configuration fi=
les, header files, and any other Arm Tools or components thereof owned by A=
rm (or licensed by Arm and provided to you under Arm's terms and conditions=
) which you are permitted to include within Your Software and redistribute =
or sub-license within Your Software to third parties, the details of which =
(if applicable) are set out in a file or folder (the "Redistributables File=
") typically named 'redistributables' located within the 'license_terms' fo=
lder in an Arm Tool (or components thereof).
 "Software Information File(s)" means Third Party Licenses Files, Redistrib=
utables Files, and/or Supplementary Terms Files (as the context requires).
 "Special Conditions" is as defined above in Recital (B) of this License.
-"Specified Project" means a single design and development activity underta=
ken by you or your Permitted Users relating to Your Software or Your Hardwa=
re, the details of which will be set out in the order documentation provide=
d to you by Arm.
-"Supplementary Terms File" means a software file or folder typically named=
 'supplementary_terms' located within an Arm Tool (or components thereof) w=
hich (if applicable) details any component-specific extensions, limitations=
 or other variations to the terms of this License.
+"Specified Project" means a single design and development activity underta=
ken by you or your Permitted Users relating to Your Software or Your Hardwa=
re, the details of which (if applicable) shall be set out in the order docu=
mentation provided to you by Arm.
+"Supplementary Terms File" means a software file or folder typically named=
 'supplementary_terms' located within the 'license_terms' folder in an Arm =
Tool (or components thereof) which (if applicable) details any component-sp=
ecific extensions, limitations or other variations to the terms of this Lic=
ense.
 "Territory" means, if applicable, the geographical area detailed in the or=
der documentation provided to you by Arm to which your use of the Arm Tools=
 or any part thereof is restricted.
-"Third Party Licenses File" means a software file or folder typically name=
d 'third_party_licenses' located within an Arm Tool (or components thereof)=
 which (if applicable) details any third party material included in the rel=
evant Arm Tool which is not licensed under the terms of this License, and a=
 reference to the applicable third party license terms and conditions.
+"Third Party Licenses File" means a software file or folder typically name=
d 'third_party_licenses' located within the 'license_terms' folder in an Ar=
m Tool (or components thereof) which (if applicable) details any third part=
y material included in the relevant Arm Tool which is not licensed under th=
e terms of this License, and references the applicable third party license =
terms and conditions.
 "Update" means an update, patch, hotfix, bug fix, support release, modific=
ation or limited functional enhancement (as applicable) to an Arm Tool or c=
omponent thereof, including but not limited to error corrections to any pro=
gram or associated documentation developed by or for Arm comprised in the A=
rm Tools, which (i) Arm makes generally available to the market, and (ii) d=
oes not, in Arm's opinion, constitute an Upgrade or a new product.
 "Upgrade" means a new release of an existing Arm Tool which Arm makes gene=
rally available to the market and which usually contains major functional i=
mprovements.
 "Your Hardware" means hardware manufactured or developed by you or on your=
 behalf, or hardware owned or licensed by you, which is supported by the Ar=
m Tools.
-"Your Reports" means any written reports or other information relating to =
the behavior or performance of Your Software or Your Hardware, in html, bin=
ary, text or any other format (excluding for the avoidance of doubt, Arm To=
ols Performance Data), generated by you from or using the Arm Tools and any=
 modifications thereto.
-"Your Software" means any software owned or licensed by you (including, bu=
t not limited to, applications, libraries and Arm API compliant plug-ins, b=
ut excluding Arm Software) which is supported by (or developed by you using=
) the Arm Tools.
+"Your Reports" means any written reports or other information relating to =
the behavior, performance or configuration of Your Software or Your Hardwar=
e, in html, binary, text or any other format (excluding for the avoidance o=
f doubt, Arm Tools Performance Data), generated by you from or using Arm To=
ols and any modifications thereto.
+"Your Software" means any software owned or licensed by you (including, bu=
t not limited to, applications, libraries and Arm API compliant plug-ins, b=
ut excluding Arm Software) which is supported by (or developed by you using=
) Arm Tools.
=20
-1. LICENSE GRANT
-1.1 Subject to your compliance with the terms and conditions of this Licen=
se, and payment by you of the Fees (if any), Arm hereby grants to you and y=
our Permitted Users during the License Term a non-exclusive, non-transferab=
le license to receive and use the Arm Tools, certain components thereof, or=
 optional functionality, in the Territory only on the Licensed Seats or for=
 a Specified Project (as applicable) for the permitted uses set out in this=
 clause 1 and subject to the restrictions set out in clause 2 (as limited, =
extended or otherwise varied by any terms, including product-specific permi=
tted uses and restrictions, set out in the Special Conditions). Except as e=
xpressly permitted by this License, you and your Permitted Users shall NOT =
copy, modify, sub-license, redistribute or otherwise use any component of t=
he Arm Tools.
+2.      LICENSE GRANT
+2.1     Subject to your compliance with the terms and conditions of this L=
icense, and payment by you of the Fees (if any), Arm hereby grants to you a=
nd your Permitted Users during the License Term a non-exclusive, non-transf=
erable license to receive and use the Arm Tools, certain components thereof=
, or optional functionality, in the Territory only on the Licensed Seats or=
 for a Specified Project (as applicable) for the permitted uses set out in =
this clause 2 and subject to the restrictions set out in clause 3 (as limit=
ed, extended or otherwise varied by any terms, including product-specific p=
ermitted uses and restrictions, set out in the Special Conditions). Except =
as expressly permitted by this License, you and your Permitted Users shall =
NOT copy, modify, sub-license, redistribute or otherwise use any component =
of the Arm Tools.
=20
-1.2 PERMITTED USE OF THE ARM TOOLS: Except as otherwise provided in this L=
icense, use of the Arm Tools (or components thereof) is permitted for the p=
urpose of:
+2.2 PERMITTED USE OF THE ARM TOOLS: Except as otherwise provided in this L=
icense, use of the Arm Tools (or components thereof) is permitted for the p=
urpose of:
 (a) building, developing, testing, debugging, analysing and optimising You=
r Software or Your Hardware;
 (b) generation of Your Reports, and use of Your Reports to develop, test, =
debug, analyse and optimise Your Software or Your Hardware; and
-(c) only as expressly provided in the relevant Redistributables File: (i) =
incorporating, compiling and/or linking the files listed in that Redistribu=
tables File into Your Software, provided that Your Software contains substa=
ntial additional functionality; and (ii) subject to clause 2.1 below, repro=
ducing and redistributing the files (and permitting your customers and/or y=
our authorised distributors to reproduce and redistribute the files), only =
in object code form (unless otherwise specified in the relevant Redistribut=
ables Files), and only as part of Your Software. You agree that, except as =
expressly provided to the contrary in the relevant Redistributables File, y=
ou may only copy the Arm Tools (or any component thereof) to the extent tha=
t such copying is incidental to the permitted uses set out in this clause 1=
.2, including installation, backup and execution.
-
-2. YOUR OBLIGATIONS AND RESTRICTIONS ON USE
-2.1 OBLIGATIONS RELATING TO REDISTRIBUTION: Any redistribution as permitte=
d by this License is subject to any restrictions set out in the applicable =
Special Conditions, and your compliance with the following:
-(a) in cases where you are expressly permitted under this License (includi=
ng for the avoidance of doubt by inclusion of agreed wording in the order d=
ocumentation provided to you by Arm) to sub-license or redistribute any com=
ponent of the Arm Tools to your customers, authorised distributors or other=
 third parties, you are responsible for ensuring that such customers, autho=
rised distributors and third parties accept, and are contractually bound (b=
y agreement with you or directly with Arm) to comply with, the terms and co=
nditions of this License;
-(b) Any use by you of Arm's or any of its licensors' names, logos or trade=
marks to publicise or market any of Your Software containing (or developed =
or generated using) Arm Tools is subject to you obtaining express written p=
ermission from Arm;
-(c) You warrant that you shall not make any representations or warranties =
on behalf of Arm in respect of any of the Arm Tools or in respect of any ot=
her software, reports or documentation developed or generated by you in acc=
ordance with the license grants set out in this License;
-(d) You must reproduce or preserve (as applicable) any copyright notices w=
hich are included in or with any Arm Tools or components thereof; and
-(e) Except as otherwise agreed by Arm (including for the avoidance of doub=
t by inclusion of the relevant permission in a Supplementary Terms File), y=
ou may not disclose or otherwise distribute any Arm Tools Performance Data.=
 For the avoidance of doubt, nothing in this sub-clause 2.1 (e) shall preve=
nt you from disclosing or otherwise distributing Your Reports.
-
-2.2 NON-COMMERCIAL USE AND FREE OF CHARGE LICENSES: If you are in receipt =
of a Non-Commercial Use License for the Arm Tools, or the Arm Tools or any =
component thereof are identified or classified as such, and/or you are rece=
iving the Arm Tools free of charge, then notwithstanding any of the other t=
erms and conditions of this License, your use (which includes use by your P=
ermitted Users) of the Arm Tools is limited as follows:
-(a) if you are receiving the Arm Tools free of charge:
-(i) no support or maintenance shall be provided to you in respect of the A=
rm Tools;
-(ii) the warranty set out in clause 7.1 of this License does not apply to =
you or your use of the Arm Tools, and Arm gives no other warranty whatsoeve=
r in relation to (and accepts no liability in connection with) the Arm Tool=
s or your use (as permitted by this License) of them;
-(iii) Arm may immediately terminate this License at any time for any reaso=
n by giving written notice to you;
-(iv) except as otherwise expressly agreed in writing by Arm, you shall gra=
nt to Arm in full the license set out in clause 3.2 of this License; and/or
-(b) if you are receiving a Non-Commercial Use License or version (as appli=
cable) of the Arm Tools:
-(i) you and your Permitted Users may use the Arm Tools for internal use on=
ly; and
-(ii) you are not permitted to distribute or sub-license (A) any part of th=
e Arm Tools, or (B) Your Software, Your Hardware, or Your Reports developed=
 under this License using the Arm Tools. The Arm Tools shall be used only b=
y you and your Permitted Users, and you shall not (except as otherwise auth=
orised in writing by Arm) allow any other third party whatsoever to use the=
 Arm Tools.
+(c) only as expressly permitted in the relevant Redistributables File: (i)=
 incorporating, compiling and/or linking the files listed in that Redistrib=
utables File into Your Software, provided that Your Software contains subst=
antial additional functionality; and (ii) subject to clause 3.1 below, repr=
oducing and redistributing the files (and permitting your customers and/or =
your authorised distributors to reproduce and redistribute the files), only=
 in object code form (unless otherwise specified in the relevant Redistribu=
tables Files), and only as part of Your Software. You agree that, except as=
 expressly provided to the contrary in the relevant Redistributables File, =
you may only copy the Arm Tools (or any component thereof) to the extent th=
at such copying is incidental to the permitted uses set out in this clause =
2.2, including installation, backup and execution.
+
+3.      YOUR OBLIGATIONS AND RESTRICTIONS ON USE
+3.1     OBLIGATIONS RELATING TO REDISTRIBUTION: Any redistribution as perm=
itted by this License is subject to any restrictions set out in the applica=
ble Special Conditions, and your compliance with the following:
+(a)     in cases where you are expressly permitted under this License (inc=
luding for the avoidance of doubt by inclusion of agreed wording in the ord=
er documentation provided to you by Arm) to sub-license or redistribute any=
 Arm Tool or component thereof to your customers, authorised distributors o=
r other third parties, you are responsible for ensuring that such customers=
, authorised distributors and third parties accept, and are contractually b=
ound (by agreement with you or directly with Arm) to comply with, the terms=
 and conditions of this License;
+(b)     any use by you of Arm's or any of its licensors' names, logos or t=
rademarks to publicise or market any of Your Software containing (or develo=
ped or generated using) Arm Tools is subject to you obtaining express writt=
en permission from Arm;
+(c)     you warrant that you shall not make any representations or warrant=
ies on behalf of Arm in respect of any of the Arm Tools or in respect of an=
y other software, reports or documentation developed or generated by you in=
 accordance with the license grants set out in this License;
+(d)     you must reproduce or preserve (as applicable) any copyright notic=
es which are included in or with any Arm Tools or components thereof; and
+(e)     except as otherwise agreed by Arm (including for the avoidance of =
doubt by inclusion of the relevant permission in a Supplementary Terms File=
), you may not disclose or otherwise distribute any Arm Tools Performance D=
ata. For the avoidance of doubt, nothing in this sub-clause 3.1 (e) shall p=
revent you from disclosing or otherwise distributing Your Reports.
+
+3.2     NON-COMMERCIAL USE AND FREE OF CHARGE LICENSES: If you are in rece=
ipt of a Non-Commercial Use License for the Arm Tools, or the Arm Tools or =
any component thereof are identified or classified as such, and/or you are =
receiving the Arm Tools free of charge, then notwithstanding any of the oth=
er terms and conditions of this License, your use (which includes use by yo=
ur Permitted Users) of the Arm Tools is limited as follows:
+(a)     if you are receiving the Arm Tools free of charge:
+(i)     no support or maintenance shall be provided to you in respect of t=
he Arm Tools;
+(ii)    the warranty set out in clause 8.1 of this License does not apply =
to you or your use of the Arm Tools, and Arm gives no other warranty whatso=
ever in relation to (and accepts no liability in connection with) the Arm T=
ools or your use (as permitted by this License) of them;
+(iii)   Arm may immediately terminate this License at any time for any rea=
son by giving written notice to you;
+(iv)    except as otherwise expressly agreed in writing by Arm, you shall =
grant to Arm in full the license set out in clause 4.2 of this License; and=
/or
+(b)     if you are receiving a Non-Commercial Use License or version (as a=
pplicable) of the Arm Tools:
+(i)     you and your Permitted Users may use the Arm Tools for internal us=
e only; and
+(ii)    you are not permitted to distribute or sub-license (A) any part of=
 the Arm Tools, or (B) Your Software, Your Hardware, or Your Reports develo=
ped under this License using the Arm Tools. The Arm Tools shall be used onl=
y by you and your Permitted Users, and you shall not (except as otherwise a=
uthorised in writing by Arm) allow any other third party whatsoever to use =
the Arm Tools.
 For the avoidance of doubt, if you are receiving a Non-Commercial Use Lice=
nse and the license is provided to you free of charge, the restrictions in =
both sub-clauses (a) and (b) above will apply to your use of the Arm Tools.
=20
-2.3 LICENSE TYPES: Depending on the type of license you have agreed to pur=
chase from Arm under this License (the details of which are set out in the =
order documentation provided to you by Arm), your use of the Arm Tools shal=
l be limited to:
-(a) use of each Licensed Seat (i) by one individual named Permitted User o=
nly on a specified item of computer hardware ('named-user license'), OR (ii=
) by one individual Permitted User at a time only on a specified item of co=
mputer hardware ('node-locked license'), OR (iii) by one individual Permitt=
ed User at a time on specified items of computer hardware ('floating licens=
e'). In respect of 'node-locked licenses', each Licensed Seat may only be u=
sed for one 'process' at any one time. For the purpose of this sub-clause 2=
.3 (a), each 'process' is the execution of an instance of an Arm Tool; or
-(b) use for a Specified Project.
+3.3     RESTRICTIONS RELATING TO LICENSE TYPES: Depending on the type of l=
icense you have purchased from Arm under this License (the details of which=
 shall be set out in the order documentation provided to you by Arm), your =
use of each Licensed Seat of an Arm Tool shall be limited to:
+(a)     for a 'Node Locked License', use only (i) on one specified item of=
 computer hardware, and (ii) at any point in time, by one individual Permit=
ted User for one 'process'. For the purpose of this sub-clause 3.3 (a), eac=
h 'process' is the execution of an instance of an Arm Tool;
+(b)     for a 'Floating License', use only by one individual Permitted Use=
r at a time on specified items of computer hardware;
+(c)     for an 'Authorised User License', use only by (i) one individual a=
ssigned Permitted User, OR (ii) one assigned Automation Process, provided a=
lways that only Permitted Users that have a valid Authorised User License f=
or an Arm Tool shall be permitted to deliver to an Automation Process jobs =
generated using that Arm Tool. For the purposes of this sub-clause 3.3 (c),=
 "Automation Process" means a process or processes used to automate certain=
 software methods, such as continuous integration; or
+(d)     in respect of a 'Specified Project License', use for a Specified P=
roject.
=20
-2.4 PERMITTED USERS: You hereby agree to be responsible for the acts and o=
missions of any and all Permitted Users, and shall ensure that such Permitt=
ed Users (i) are contractually obliged to comply with the terms of this Lic=
ense, including those relating to confidentiality; and (ii) do not supply t=
he Arm Tools or any components thereof to any third party whatsoever. Excep=
t as expressly provided in this License or as agreed in writing by Arm on a=
 case by case basis, you shall not sub-license, redistribute, lease, rent o=
r otherwise allow any third party to use the Arm Tools or License Keys.
+3.4     PERMITTED USERS: You hereby agree to be responsible for the acts a=
nd omissions of any and all Permitted Users, and shall ensure that such Per=
mitted Users (i) are contractually obliged to comply with the terms of this=
 License, including those relating to confidentiality; and (ii) do not supp=
ly Arm Tools or any components thereof to any third party whatsoever. Excep=
t as expressly provided in this License or as agreed in writing by Arm on a=
 case by case basis, you shall not sub-license, redistribute, lease, rent o=
r otherwise allow any third party to use the Arm Tools or License Keys.
=20
-2.5 REVERSE ENGINEERING: Your use of the Arm Tools shall specifically excl=
ude the reverse engineering, decompiling, disassembly, translation, adaptat=
ion, arrangement or other alteration of any part of the Arm Tools (except t=
o the extent that applicable law overrides this provision or any part hereo=
f).
+3.5     REVERSE ENGINEERING: Your use of Arm Tools shall specifically excl=
ude the reverse engineering, decompiling, disassembly, translation, adaptat=
ion, arrangement or other alteration of any part of the Arm Tools (except t=
o the extent that applicable law overrides this provision or any part hereo=
f).
=20
-2.6 COPYRIGHT AND RESERVATION OF RIGHTS: The Arm Tools are owned by Arm an=
d/or its licensors and are protected by copyright and other intellectual pr=
operty rights, laws and international treaties. The Arm Tools are licensed =
not sold. Except as expressly provided by this License, you acquire no righ=
ts to the Arm Tools or any element thereof, or to any other Arm products or=
 services. You shall not remove from the Arm Tools any copyright notice or =
other notice and shall ensure that any such notice is reproduced in any per=
mitted reproduction of the whole or any part of the Arm Tools.
+3.6     COPYRIGHT AND RESERVATION OF RIGHTS: Arm Tools are owned by Arm an=
d/or its licensors and are protected by copyright and other intellectual pr=
operty rights, laws and international treaties. Arm Tools are licensed not =
sold. Except as expressly provided by this License, you acquire no rights t=
o any Arm Tools or elements thereof, or to any other Arm products or servic=
es. You shall not remove from Arm Tools any copyright notice or other notic=
e and shall ensure that any such notice is reproduced in any permitted repr=
oduction of the whole or any part of the Arm Tools.
=20
-2.7 TECHNICAL RESTRICTIONS IN THE ARM TOOLS: You must comply with any tech=
nical restrictions in the Arm Tools and License Keys, including any restric=
tions that restrict use to certain components of the Arm Tools or use only =
for certain purposes. You shall not work around any such technical restrict=
ions.
+3.7     TECHNICAL RESTRICTIONS IN THE ARM TOOLS: You must comply with any =
technical restrictions in Arm Tools and License Keys, including any restric=
tions that restrict use to certain components of Arm Tools or use only for =
certain purposes. You shall not work around any such technical restrictions.
=20
-2.8 ARM DOCUMENTATION: You may use the Arm Documentation (if any) internal=
ly only in conjunction with your use of the Arm Software to which it relate=
s.
+3.8     ARM DOCUMENTATION: Use of Arm Documentation (if any) is permitted =
internally only in conjunction with your use of the Arm Software to which i=
t relates.
=20
-3. LICENSE OF FEEDBACK TO ARM
-3.1 You may at your discretion deliver any suggestions, comments, feedback=
, ideas, or know-how (whether in oral or written form) to Arm relating to o=
r connected with your use of the Arm Tools ("Feedback"). Notwithstanding th=
e foregoing, you shall not knowingly give to Arm any Feedback that you are =
aware (or should reasonably be aware) is subject to any patent, copyright o=
r other intellectual property claim or right of any third party.
+4. LICENSE OF FEEDBACK TO ARM
+4.1     You may at your discretion deliver any suggestions, comments, feed=
back, ideas, or know-how (whether in oral or written form) to Arm relating =
to or connected with your use of Arm Tools ("Feedback"). Notwithstanding th=
e foregoing, you shall not knowingly give to Arm any Feedback that you are =
aware (or should reasonably be aware) is subject to any patent, copyright o=
r other intellectual property claim or right of any third party.
=20
-3.2 Except as expressly notified by you to Arm (in writing which may inclu=
de email) to the contrary, you hereby grant to Arm under your and your affi=
liates (as applicable) intellectual property, a perpetual, irrevocable, roy=
alty free, non-exclusive, worldwide license to: (i) use, copy, modify, and =
create derivative works of the Feedback; (ii) sell, supply or otherwise dis=
tribute the whole or any part of the Feedback (and derivative works thereof=
) as part of any Arm owned or licensed product(s) without obligation or res=
triction of any kind; and (iii) sub-license to third parties the foregoing =
rights, including the right to sub-license to further third parties. No rig=
ht is granted by you to Arm to sub-license your and your affiliates (as app=
licable) intellectual property except to the extent that it is provided to =
Arm as Feedback and is embodied in any Arm owned or licensed product(s). Fo=
r the avoidance of doubt, if, during the License Term, you provide notice t=
o Arm revoking the license granted under this clause 3.2, you acknowledge a=
nd agree that such revocation shall not apply to Feedback delivered to Arm =
prior to the date of receipt of the revocation notice, and that (notwithsta=
nding the foregoing) Arm shall continue to be permitted to use Feedback rec=
eived after the date of receipt of the revocation notice for internal purpo=
ses.
+4.2     Except as expressly notified by you to Arm (in writing which may i=
nclude email) to the contrary, you hereby grant to Arm under your and your =
affiliates (as applicable) intellectual property rights, a perpetual, irrev=
ocable, royalty free, non-exclusive, worldwide license to: (i) use, copy, m=
odify, and create derivative works of the Feedback; (ii) sell, supply or ot=
herwise distribute the whole or any part of the Feedback (and derivative wo=
rks thereof) as part of any Arm owned or licensed product(s) without obliga=
tion or restriction of any kind; and (iii) sub-license to third parties the=
 foregoing rights, including the right to sub-license to further third part=
ies. No right is granted by you to Arm to sub-license your and your affilia=
tes (as applicable) intellectual property rights except to the extent that =
it is provided to Arm as Feedback and is embodied in any Arm owned or licen=
sed product(s). For the avoidance of doubt, if, during the License Term, yo=
u provide notice to Arm revoking the license granted under this clause 4.2,=
 you acknowledge and agree that such revocation shall not apply to Feedback=
 delivered to Arm prior to the date of receipt of the revocation notice, an=
d that (notwithstanding the foregoing) Arm shall continue to be permitted t=
o use Feedback received after the date of receipt of the revocation notice =
for internal purposes.
=20
-3.3 Except as expressly licensed to Arm in clause 3.2, you retain all righ=
t, title and interest in and to the Feedback provided by you under this Lic=
ense.
+4.3     Except as expressly licensed to Arm in clause 4.2, you retain all =
right, title and interest in and to the Feedback provided by you under this=
 License.
=20
-4. DATA COLLECTION AND PRIVACY
-4.1 The Arm Software may include features that enable it to transmit certa=
in computer information over the internet to Arm's and/or its service provi=
ders' computer systems, for example your computer's internet protocol addre=
ss, computer hardware and operating system details, or the serial numbers o=
f the Arm Tools you have licensed. This information will not be shared with=
 any third parties, and shall be used by Arm only for the purpose of Arm pr=
otecting its legitimate interests, which may include Arm verifying your rig=
ht to use the Arm Tools and monitoring your compliance with the permitted u=
ses and restrictions set out in this License.
+5. DATA COLLECTION AND PRIVACY
+5.1     Arm Software may include features that enable it to transmit certa=
in computer information over the internet to Arm's computer systems. Any no=
n-anonymous data collected by Arm, for example your computer's internet pro=
tocol address, computer hardware and operating system details, or the seria=
l numbers of Arm Tools you have licensed, shall be used by Arm only for the=
 purpose of Arm protecting its legitimate interests, which may include Arm =
verifying your right to use any Arm Tools and monitoring your compliance wi=
th the permitted uses and restrictions set out in this License.
=20
-4.2 Arm may also collect anonymous data, which, for the avoidance of doubt=
, cannot be used to identify individual users of the Arm Tools. This inform=
ation may be used by Arm to help us understand and analyse what components =
or features in the Arm Tools our end users are using in order to (i) mainta=
in and improve the quality of the Arm Tools and the end user experience, (i=
i) inform end users of relevant new and improved products and services, and=
 (iii) assist end users to maximise the performance of, or solve user exper=
ience issues with, the Arm Tools.
+5.2     Arm may also collect anonymous data, which, for the avoidance of d=
oubt, cannot be used to identify individual users of Arm Tools. This inform=
ation may be used by Arm to help us understand and analyse what components =
or features in Arm Tools our end users are using in order to (i) maintain a=
nd improve the quality of the Arm Tools and the end user experience, (ii) i=
nform end users of relevant new and improved products and services, and (ii=
i) assist end users to maximise the performance of, or solve user experienc=
e issues with, the Arm Tools.
=20
-4.3 Information collected by the Arm Software will only be used for the af=
orementioned purposes. Please refer to the Arm Privacy Policy https://www.a=
rm.com/company/policies/privacy for further information on how Arm collects=
, uses and safeguards personal data (including but not limited to personal =
data collected for the protection of Arm's legitimate interests and your ri=
ghts to object to its collection).
+5.3     Information collected by Arm Software will only be used for the af=
orementioned purposes. Please refer to the Arm Privacy Policy https://www.a=
rm.com/company/policies/privacy for further information on how Arm collects=
, uses and safeguards personal data (including but not limited to personal =
data collected for the protection of Arm's legitimate interests and your ri=
ghts to object to its collection).
=20
-5. SUPPORT AND MAINTENANCE
-5.1 Provision of reasonable support and maintenance is subject to payment =
by you of all applicable Fees.
+6. SUPPORT AND MAINTENANCE
+6.1     Provision of reasonable support and maintenance is subject to paym=
ent by you of all applicable Fees.
=20
-5.2 Any support provided by Arm in accordance with the above clause 5.1 sh=
all (i) be provided by telephone, email or such other format as is designat=
ed by Arm, (ii) be prioritised at Arm's discretion, and (iii) not be used a=
s a substitute for training or as additional resource for your projects.
+6.2     Any support provided by Arm in accordance with the above clause 6.=
1 shall (i) be provided by telephone, email or such other format as is desi=
gnated by Arm, (ii) be prioritised at Arm's discretion, and (iii) not be us=
ed as a substitute for training or as additional resource for your projects.
=20
-5.3 Maintenance will generally be provided in the form of Updates to the A=
rm Tools. Arm shall be under no obligation to provide such maintenance in r=
espect of any modifications made by you (where permitted) to the Arm Tools.=
 Updates do not constitute additional Licensed Seats and may only be used b=
y you if you have an active Licensed Seat to run and use such Updates. Upda=
tes will generally be provided to you as soon as reasonably practicable fol=
lowing the date of general public release of the Update by Arm.
+6.3     Maintenance will generally be provided in the form of Updates to A=
rm Tools. Arm shall be under no obligation to provide such maintenance in r=
espect of any modifications made by you (where permitted) to Arm Tools. Upd=
ates do not constitute additional Licensed Seats and may only be used by yo=
u if you have an active Licensed Seat to run and use such Updates. Updates =
will generally be provided to you as soon as reasonably practicable followi=
ng the date of general public release of the Update by Arm.
=20
-5.4 In cases where the Arm Tools were provided to you free of charge, you =
are not entitled to any support or maintenance for the Arm Tools from Arm, =
but Arm may, in its sole discretion, provide support to you. If you obtaine=
d the Arm Tools from an Arm authorised distributor, reseller or other third=
 party, support and maintenance may be provided by either Arm or the third =
party as per the terms of your contract for supply. Arm shall not be respon=
sible for any delay or failure in connection with any third party supplier =
providing support or maintenance that it is obligated to provide to you. Pl=
ease refer to the 'Support' area of https://www.arm.com for details of Arm'=
s support services, relevant contact details, and (if applicable) details o=
f other authorised support channels.
+6.4     In cases where the Arm Tools were provided to you free of charge, =
you are not entitled to any support or maintenance for the Arm Tools from A=
rm, but Arm may, in its sole discretion, provide support to you. If you obt=
ained the Arm Tools from an Arm authorised distributor, reseller or other t=
hird party, support and maintenance may be provided by either Arm or the th=
ird party as per the terms of your contract for supply. Arm shall not be re=
sponsible for any delay or failure in connection with any third party suppl=
ier providing support or maintenance that it is obligated to provide to you=
. Please refer to the 'Support' area of https://www.arm.com for details of =
Arm's support services, relevant contact details, and (if applicable) detai=
ls of other authorised support channels.
=20
-5.5 Arm's obligations under this clause 5 are limited to the provision of =
support and maintenance to you, and Arm is under no obligation to provide a=
ny support and maintenance to any third parties. You agree to provide all f=
ront line support services to all third parties to whom you distribute any =
Arm Tools, Your Reports, Your Software or Your Hardware, pursuant to and in=
 accordance with the terms of this License.
+6.5     Any obligation Arm has under this clause 6 is limited to the provi=
sion of support and maintenance to you, and Arm is under no obligation to p=
rovide any support and maintenance to any third parties. You agree to provi=
de all front line support services to all third parties to whom you distrib=
ute any Arm Tools, Your Reports, Your Software or Your Hardware, pursuant t=
o and in accordance with the terms of this License.
=20
-5.6 This License does not grant you any entitlement to receive (i) Upgrade=
s, (ii) Arm products other than those specified in your product documentati=
on, or (iii) any new products developed or introduced by Arm from time to t=
ime, nor to receive any support or maintenance in respect of the same.
+6.6     This License does not grant you any entitlement to receive (i) Upg=
rades, (ii) Arm products other than those specified in your product documen=
tation, or (iii) any new products developed or introduced by Arm from time =
to time, nor to receive any support or maintenance in respect of the same.
=20
-6. CONFIDENTIALITY
-6.1 You acknowledge that the Arm Tools, License Keys, Arm Tools Performanc=
e Data, and any and all other software, documentation or other information =
licensed to you by Arm, or provided to you during discussions about or in c=
onnection with the Arm Tools (including this License and information provid=
ed during the provision by Arm of any support), contain trade secrets and c=
onfidential information of Arm ("Confidential Information").
+7. CONFIDENTIALITY
+7.1 You acknowledge that the Arm Tools, License Keys, Arm Tools Performanc=
e Data, and any and all other software, documentation or other information =
licensed to you by Arm, or provided to you during discussions about or in c=
onnection with the Arm Tools (including this License and information provid=
ed during the provision by Arm of any support), contain trade secrets and c=
onfidential information of Arm ("Confidential Information").
=20
-6.2 You agree to maintain all such Confidential Information in confidence =
and apply security measures (such measures to be no less stringent than the=
 measures which you apply (or should reasonably apply) to protect your own =
like information, but not less than a reasonable degree of care) to prevent=
 their unauthorised disclosure and use.
+7.2 You agree to maintain all such Confidential Information in confidence =
and apply security measures (such measures to be no less stringent than the=
 measures which you apply (or should reasonably apply) to protect your own =
like information, but not less than a reasonable degree of care) to prevent=
 their unauthorised disclosure and use.
=20
-6.3 Subject to any restrictions imposed by applicable law, the period of c=
onfidentiality shall be five (5) years from the date of disclosure of the C=
onfidential Information. You agree that you shall not use any such informat=
ion other than in your normal use of the Arm Tools as permitted by this Lic=
ense.
+7.3 Subject to any restrictions imposed by applicable law, the period of c=
onfidentiality shall be indefinite. You agree that you shall not use any su=
ch information other than in your normal use of the Arm Tools as permitted =
by this License.
=20
-7. LIMITED WARRANTIES
-7.1 Subject to the restrictions in clause 2, for the period of ninety (90)=
 days from the date of receipt by you of the Arm Tools, Arm warrants to you=
 that (i) the media on which any Arm Software is provided shall be free fro=
m defects in materials and workmanship under normal use; and (ii) the Arm S=
oftware will perform substantially in accordance with the accompanying Arm =
Documentation (if any). Arm's total liability and your exclusive remedy for=
 breach of these warranties shall be limited to Arm, at Arm's option (a) re=
placing the defective Arm Software; or (b) using reasonable efforts to corr=
ect material, documented, reproducible defects in the Arm Software and deli=
vering such corrected Arm Software to you; or (c) if you licensed the Arm S=
oftware directly from Arm, refunding the price paid by you to Arm for that =
Arm Software. Any replacement Arm Software will be warranted for the remain=
der of the original warranty period or thirty (30) days from the date of re=
placement, whichever is longer.
+8 LIMITED WARRANTIES
+8.1     For the period of ninety (90) days from the date of receipt by you=
 of Arm Tools, Arm warrants to you that; (i) Arm Software will perform subs=
tantially in accordance with the accompanying Arm Documentation (if any); a=
nd (ii) Arm Software will be compatible with the hardware and software ment=
ioned as such in the Arm Documentation. Arm's total liability and your excl=
usive remedy for breach of these warranties shall be limited to Arm, at Arm=
's option (a) replacing any defective Arm Software; or (b) using reasonable=
 efforts to correct material, documented, reproducible defects in the Arm S=
oftware and delivering such corrected Arm Software to you; or (c) if you li=
censed the Arm Software directly from Arm, refunding the price paid by you =
to Arm for that Arm Software. Any replacement Arm Software will be warrante=
d for the remainder of the original warranty period or thirty (30) days fro=
m the date of replacement, whichever is longer.
=20
-7.2 The Arm Software described in any Arm Documentation is subject to cont=
inuous development and improvement. All particulars of the Arm Software and=
 its use as described in the Arm Documentation are given by Arm in good fai=
th. Consequently, the information contained in the Arm Documentation is sub=
ject to change without notice and is not warranted to be error free. If you=
 discover any errors in the Arm Documentation please report them to Arm in =
writing. Any Arm Documentation provided to you that relates to specific ind=
ustry quality and functional safety standard compliance may assist you in a=
pplying to a competent auditor for certification of Your Software or Your H=
ardware, but you acknowledge and agree that on its own such Arm Documentati=
on may not provide sufficient evidence of, or be compatible with, the requi=
red safety compliance standards.
+8.2     Arm Software described in any Arm Documentation is subject to cont=
inuous development and improvement. All particulars of Arm Software and its=
 use as described in the applicable Arm Documentation are given by Arm in g=
ood faith. Consequently, the information contained in Arm Documentation is =
subject to change without notice and is not warranted to be error free. If =
you discover any errors in Arm Documentation please report them to Arm in w=
riting. Any Arm Documentation provided to you that relates to specific indu=
stry quality and functional safety standard compliance may assist you in ap=
plying to a competent auditor for certification of Your Software or Your Ha=
rdware, but you acknowledge and agree that on its own such Arm Documentatio=
n may not provide sufficient evidence of, or be compatible with, the requir=
ed safety compliance standards.
=20
-7.3 Except as provided in clause 7.1 above, you agree that the Arm Tools a=
re licensed "as is", and that Arm expressly disclaims all representations, =
warranties, conditions or other terms, express or implied or statutory, inc=
luding without limitation the implied warranties of non-infringement, satis=
factory quality, and fitness for a particular purpose. You acknowledge that=
 it is your responsibility to satisfy yourself that the Arm Tools are fit f=
or the intended purpose and satisfy your requirements, including compatibil=
ity with Your Hardware, and you expressly assume all liabilities and risks =
relating to (i) any use of an Arm Tool which is inconsistent with its desig=
n or any guidance provided to you in the applicable Arm Documentation, and/=
or (ii) any use of an Arm Tool with Your Software or Your Hardware where su=
ch software or hardware (as applicable) is not supported by or compatible w=
ith the relevant Arm Tool.
+8.3     Except as provided in clause 8.1 above, you agree that Arm Tools, =
and any associated support and maintenance, are licensed or provided (as ap=
plicable) "as is", and that Arm and its licensors expressly disclaim all re=
presentations, warranties, conditions or other terms, express or implied or=
 statutory, including, without limitation, the implied warranties of mercha=
ntability, non-infringement, satisfactory quality, and fitness for a partic=
ular purpose. You acknowledge that it is your responsibility to satisfy you=
rself that any Arm Tools are fit for the intended purpose and satisfy your =
requirements, including compatibility with Your Hardware, and you expressly=
 assume all liabilities and risks relating to (i) any use of an Arm Tool wh=
ich is inconsistent with its design or any guidance provided to you in the =
applicable Arm Documentation, and/or (ii) any use of an Arm Tool with Your =
Software or Your Hardware where such software or hardware (as applicable) i=
s not supported by or compatible with the relevant Arm Tool.
=20
-7.4 You expressly assume all liabilities and risks relating to your use or=
 operation of Your Software and Your Hardware designed or modified using th=
e Arm Tools, including without limitation, Your software or Your Hardware d=
esigned or intended for safety-critical applications. Should Your Software =
or Your Hardware prove defective, you assume the entire cost of all necessa=
ry servicing, repair or correction.
+8.4     You expressly assume all liabilities and risks relating to your us=
e or operation of Your Software and Your Hardware designed or modified usin=
g Arm Tools, including without limitation, Your software or Your Hardware d=
esigned or intended for safety-critical applications. Should Your Software =
or Your Hardware prove defective, you assume the entire cost of all necessa=
ry servicing, repair or correction.
=20
-8. LIMITATION OF LIABILITY
-8.1 To the maximum extent permitted by applicable law, in no event shall A=
rm be liable for any indirect, special, incidental or consequential damages=
 (including loss of profits) arising out of the use of, or inability to use=
, the Arm Tools, whether based on a claim under contract, tort or otherwise=
, even if Arm was advised of the possibility of such damages.
+9 LIMITATION OF LIABILITY
+9.1     To the maximum extent permitted by applicable law, in no event sha=
ll Arm be liable for any indirect, special, incidental or consequential dam=
ages (including loss of profits) arising out of the use of, or inability to=
 use, Arm Tools, whether based on a claim under contract, tort or otherwise=
, even if Arm was advised of the possibility of such damages.
=20
-8.2 Arm does not seek to limit or exclude liability for death or personal =
injury arising from Arm's negligence or Arm's fraud. Arm acknowledges that =
certain jurisdictions do not permit the exclusion or limitation of liabilit=
y for consequential or incidental damages, and in such cases the above limi=
tation relating to liability for consequential damages may not apply to you.
+9.2     Arm does not seek to limit or exclude liability for death or perso=
nal injury arising from Arm's negligence or Arm's fraud. Arm acknowledges t=
hat certain jurisdictions do not permit the exclusion or limitation of liab=
ility for consequential or incidental damages, and in such cases the above =
limitation relating to liability for consequential damages may not apply to=
 you.
=20
-8.3 Notwithstanding anything to the contrary contained in this License, th=
e maximum liability of Arm to you in aggregate (in contract, tort or otherw=
ise) in relation to or in connection with the subject matter of this Licens=
e shall not exceed the greater of (i) the total sums paid by you to Arm (if=
 any) for this License, and (ii) $10.00 USD. The existence of more than one=
 claim will not enlarge or extend the limit.
+9.3     Notwithstanding anything to the contrary contained in this License=
, the maximum liability of Arm to you in aggregate (in contract, tort or ot=
herwise) in relation to or in connection with the subject matter of this Li=
cense shall not exceed the greater of (i) the total sums paid by you to Arm=
 (if any) for this License, and (ii) $10.00 USD. The existence of more than=
 one claim or suit will not enlarge or extend the limit. You release Arm fr=
om all obligations, liability, claims or demands in excess of this limitati=
on.
=20
-9. THIRD PARTY MATERIAL
-9.1 The Arm Tools may contain material owned or developed by third parties=
, including but not limited to open source software, freeware and commercia=
l software ("Third Party Material"). Any Third Party Material is subject to=
 the terms and conditions of the applicable Third Party Material license(s)=
 and is not covered under the terms of this License. Details relating to su=
ch Third Party Material shall either be presented to you at the time of ins=
tallation or shall be detailed in the Third Party Licenses File(s). Your us=
e of such Third Party Material is subject to your compliance with the appli=
cable Third Party Material license(s).
+10 THIRD PARTY MATERIAL
+10.1    Arm Tools may contain material owned or developed by third parties=
, including but not limited to open source software, freeware and commercia=
l software ("Third Party Material"). Details relating to such Third Party M=
aterial shall be detailed in the Third Party Licenses File(s). Your use of =
such Third Party Material is subject to your compliance with the applicable=
 Third Party Material license(s).
=20
-9.2 Arm hereby disclaims any and all warranties express or implied from an=
y third parties regarding, or otherwise connected with, any Third Party Mat=
erial included in the Arm Tools and any Third Party Material from which the=
 Arm Tools are derived, and/or your use of any or all of the Third Party Ma=
terial in connection with Your Software or Your Hardware, including (withou=
t limitation) any warranties of satisfactory quality or fitness for a parti=
cular purpose.
+10.2    Arm hereby disclaims any and all warranties express or implied fro=
m any third parties regarding, or otherwise connected with, any Third Party=
 Material included in Arm Tools and any Third Party Material from which any=
 Arm Tools are derived, and/or your use of any or all of the Third Party Ma=
terial in connection with Your Software or Your Hardware, including (withou=
t limitation) any warranties of satisfactory quality or fitness for a parti=
cular purpose.
=20
-9.3 No Third Party Material licensors shall have any liability for any dir=
ect, indirect, incidental, special, exemplary, or consequential damages (in=
cluding without limitation lost profits) howsoever caused and whether made =
under contract, tort or otherwise arising in any way out of your use or dis=
tribution of the Third Party Material or the exercise of any rights granted=
 under either or both this License and the legal terms applicable to any Th=
ird Party Material, even if advised in advance of the possibility of such d=
amages.
+10.3    No Third Party Material licensors shall have any liability for any=
 direct, indirect, incidental, special, exemplary, or consequential damages=
 (including without limitation lost profits) howsoever caused and whether m=
ade under contract, tort or otherwise arising in any way out of your use or=
 distribution of the Third Party Material or the exercise of any rights gra=
nted under this License, even if advised in advance of the possibility of s=
uch damages.
=20
-10. GOVERNMENT REQUIREMENTS
-10.1 To the extent that you are an agency, contractor or instrumentality o=
f the U.S. Government, you and we agree that:
-(a) the Arm Tools are commercial computer software and commercial computer=
 software documentation, and that your rights therein are as specified in t=
his License, per FAR 12.212 and DFARS 227.7202-3, as applicable, or in the =
case of NASA, subject to NSF 1852.22786. Arm acknowledges that, whilst comm=
ercial computer software or commercial computer software documentation shal=
l be acquired under licenses customarily provided to the public, such licen=
ses must be consistent with U.S. Federal law and otherwise satisfy the U.S.=
 Government's needs ("U.S. Government Requirements"); and
-(b) you may assign your rights under this License to the relevant US Gover=
nment Federal Department or the successor contractor designated by the US G=
overnment Federal Department upon termination of your related prime contrac=
t with that US Government Federal Department. If you exercise your rights u=
nder this clause 10.1(b), you acknowledge and agree that you shall remain l=
iable to Arm in respect of all your obligations under this License.
+11.     GOVERNMENT REQUIREMENTS
+11.1    To the extent that you are an agency, contractor or instrumentalit=
y of the U.S. Government, you and we agree that:
+(a)     Arm Tools are commercial computer software and commercial computer=
 software documentation, and that your rights therein are as specified in t=
his License, per FAR 12.212 and DFARS 227.7202-3, as applicable, or in the =
case of NASA, subject to NSF 1852.22786. Arm acknowledges that, whilst comm=
ercial computer software or commercial computer software documentation shal=
l be acquired under licenses customarily provided to the public, such licen=
ses must be consistent with U.S. Federal law and otherwise satisfy the U.S.=
 Government's needs ("U.S. Government Requirements"); and
+(b)     you may assign your rights under this License to the relevant US G=
overnment Federal Department or the successor contractor designated by the =
US Government Federal Department upon termination of your related prime con=
tract with that US Government Federal Department. If you exercise your righ=
ts under this clause 11.1(b), you acknowledge and agree that you shall rema=
in liable to Arm in respect of all your obligations under this License.
=20
-10.2 If there is any material inconsistency between (i) either a U.S. Gove=
rnment Requirement or a requirement of another government with which Arm is=
 mandated by statute to comply and (ii) any provision of this License, the =
terms of the relevant government requirement shall prevail and the provisio=
n in question shall be deemed varied or deleted (as applicable) as required=
 by the terms of the relevant government requirement. For the avoidance of =
doubt, in such circumstances, all other terms, conditions and provisions of=
 this License will continue to be valid to the fullest extent permitted by =
law in accordance with the below clause 12.3.
+11.2    If there is any material inconsistency between (i) either a U.S. G=
overnment Requirement or a requirement of another government with which Arm=
 is mandated by statute to comply and (ii) any provision of this License, t=
he terms of the relevant government requirement shall prevail and the provi=
sion in question shall be deemed varied or deleted (as applicable) as requi=
red by the terms of the relevant government requirement. For the avoidance =
of doubt, in such circumstances, all other terms, conditions and provisions=
 of this License will continue to be valid to the fullest extent permitted =
by law in accordance with the below clause 13.3.
=20
-11. TERM AND TERMINATION
-11.1 Subject to clauses 11.2 and 11.3 below, this License shall remain in =
force until terminated by you, by Arm or (in the case of a time limited lic=
ense) by expiry.
+12.     TERM AND TERMINATION
+12.1    Subject to clauses 12.2 and 12.3 below, this License shall remain =
in force until terminated by you, by Arm or (in the case of a time limited =
license) by expiry.
=20
-11.2 In the event of a party breaching of any of the terms and conditions =
of this License, which if capable of remedy, has not been remedied by that =
party within thirty (30) days of the date of breach, without prejudice to a=
ny of its other rights under this License, the non-breaching party may term=
inate this License immediately upon giving written notice to the breaching =
party. Upon termination of this License by you or by Arm, or upon expiry, y=
ou shall (and shall ensure that your Permitted Users shall) immediately (i)=
 stop using the Arm Tools (or any element thereof) and any Confidential Inf=
ormation and, (ii) destroy all copies of the same in your possession or con=
trol, together with all Arm Documentation and related materials.
+12.2    In the event of a party breaching of any of the terms and conditio=
ns of this License, which if capable of remedy, has not been remedied by th=
at party within thirty (30) days of the date of breach, without prejudice t=
o any of its other rights under this License, the non-breaching party may t=
erminate this License immediately upon giving written notice to the breachi=
ng party. Upon termination of this License by you or by Arm, or upon expiry=
, you shall (and shall ensure that your Permitted Users shall) immediately =
(i) stop using the relevant Arm Tools (or any element thereof) and any Conf=
idential Information and, (ii) destroy all copies of the same in your posse=
ssion or control, together with all Arm Documentation and related materials.
=20
-11.3 Notwithstanding the foregoing, except where Arm has terminated this L=
icense for your breach, your rights (if applicable) to distribute any of Yo=
ur Software or Your Hardware developed using the Arm Tools prior to termina=
tion or expiry of this License shall (subject to your continued compliance =
with the terms and conditions of this License) survive such termination or =
expiry.
+12.3    Notwithstanding the foregoing, except where Arm has terminated thi=
s License for your breach, your rights (if applicable) to distribute any of=
 Your Software or Your Hardware developed using the Arm Tools prior to term=
ination or expiry of this License shall (subject to your continued complian=
ce with the terms and conditions of this License) survive such termination =
or expiry.
=20
-12. GENERAL
-12.1 This License is governed by English Law. Notwithstanding the foregoin=
g, to the extent that you are an agency, contractor or instrumentality of t=
he U.S. Government, disputes arising under or relating to this License shal=
l be decided under the U.S. federal law of government contracting, includin=
g without limitation the Contract Disputes Act. Nothing in this License sha=
ll prevent you from enforcing your intellectual property rights or seeking =
injunctive or other equitable relief in any court of competent jurisdiction=
. The parties hereby disclaim application of the United Nations Convention =
on Contracts for the International Sale of Goods and the Uniform Computer I=
nformation Transactions Act.
+12.4    Without limitation to the survival of other terms as expressly set=
 out elsewhere in this License, upon termination or expiry of this License,=
 the provisions of clauses 1, 3.1, 3.5, 4, 7, 8, 9, 10, 12 and 13 shall sur=
vive.
=20
-12.2 Except where Arm agrees otherwise in (i) a written contract signed by=
 you and Arm, or (ii) a written contract provided by Arm and accepted by yo=
u, this is the only agreement between you and Arm relating to the Arm Tools=
 and it may only be modified by written agreement between you and Arm. No t=
erms and conditions contained in any purchase order or other document issue=
d by you, or any advertising or other representation by you or any third pa=
rty shall add to, supersede or in any way vary the terms and conditions of =
this License. This License (and any documents expressly incorporated into i=
t by reference herein) represents the entire agreement between you and Arm =
in relation to its subject matter.
+13.     GENERAL
+13.1    This License is governed by English Law. Notwithstanding the foreg=
oing, to the extent that you are an agency, contractor or instrumentality o=
f the U.S. Government, disputes arising under or relating to this License s=
hall be decided under the U.S. federal law of government contracting, inclu=
ding without limitation the Contract Disputes Act. Nothing in this License =
shall prevent you from enforcing your intellectual property rights or seeki=
ng injunctive or other equitable relief in any court of competent jurisdict=
ion. The parties hereby disclaim application of the United Nations Conventi=
on on Contracts for the International Sale of Goods and the Uniform Compute=
r Information Transactions Act.
=20
-12.3 If any clause or sentence in this License is held by a court of law t=
o be illegal or unenforceable, the remaining provisions of this License sha=
ll not be affected. Any failure by Arm to enforce any of the provisions of =
this License, unless waived in writing, shall not constitute a waiver of Ar=
m's rights to enforce such provision or any other provision of this License=
 in the future.
+13.2    Except where Arm agrees otherwise in (i) a written contract signed=
 by you and Arm, or (ii) a written contract provided by Arm and accepted by=
 you, this License (including any documents expressly incorporated herein) =
is the only agreement between you and Arm relating to the Arm Tools and it =
may only be modified by written agreement between you and Arm. No terms and=
 conditions contained in any purchase order or other document issued by you=
, or any advertising or other representation by you or any third party shal=
l add to, supersede or in any way vary the terms and conditions of this Lic=
ense. This License (and any documents expressly incorporated into it by ref=
erence herein) represents the entire agreement between you and Arm in relat=
ion to its subject matter.
+
+13.3    If any clause or sentence in this License is held by a court of la=
w to be illegal or unenforceable, the remaining provisions of this License =
shall not be affected. Any failure by Arm to enforce any of the provisions =
of this License, unless waived in writing, shall not constitute a waiver of=
 Arm's rights to enforce such provision or any other provision of this Lice=
nse in the future.
+
+13.4    Subject to clause 11.1(b), neither this License or any rights gran=
ted to you under it may be assigned, sub-licensed or otherwise transferred =
by you to any third party without the prior written consent of Arm. An assi=
gnment shall be deemed to include, without limitation (i) any transaction o=
r series of transactions whereby a third party acquires, directly or indire=
ctly, the power to control the management and policies of you, whether thro=
ugh the acquisition of voting securities, by contract or otherwise; and (ii=
) the sale of more than fifty percent (50%) of your assets whether in a sin=
gle transaction or series of transactions. Notwithstanding the foregoing, A=
rm may, in its discretion acting reasonably, separately agree to authorise =
the re-host of a Licensed Seat (for which additional charges may apply).
+
+13.5    Subject to any applicable legal restrictions, including but not li=
mited to those relating to the security of classified information, at Arm's=
 reasonable request, (i) you agree to check your computers for installation=
s of the Arm Tools, copies of License Keys, contents of any license server =
log files, individual or concurrent usage of Licensed Seats, and any other =
information requested by Arm relating to Arm Tools installation, usage and =
License Key management, and, to provide this information to Arm; and (ii) y=
ou agree that Arm may instruct appropriately qualified independent auditors=
 to perform such checks by prior appointment during your normal business ho=
urs on reasonable notice. In respect of any audit, Arm shall bear the audit=
ors' costs for that audit unless it reveals unlicensed usage, in which case=
 you shall promptly reimburse Arm for all reasonable costs and expenses, in=
cluding professional fees, relating to such audit. Any information which is=
 disclosed to Arm or such auditors during checking or audit shall be treate=
d as your confidential information and shall only be used by Arm for compli=
ance and enforcement purposes.
+
+13.6    Arm Confidential Information, Arm Tools and any other Arm products=
 provided under this License may be subject to U.K., European Union, and U.=
S. export control and sanctions laws and regulations, including the U.S. Ex=
port Administration Regulations ("EAR") (hereafter collectively referred to=
 as "Export Regulations"). The parties agree to comply fully with all appli=
cable Export Regulations. You agree that you shall not, either directly or =
indirectly, export in breach of the Export Regulations any Arm Confidential=
 Information, Arm Tools or other Arm products received under this License, =
nor any direct products thereof: (i) to any country, company or person subj=
ect to export restrictions or sanctions under the applicable Export Regulat=
ions without required export authorisation; or (ii) for any prohibited end =
use, which at the time of export requires an export license or other govern=
mental approval, without first obtaining such license or approval. The spec=
ific export controls applicable to any Arm Confidential Information, Arm To=
ols or other Arm products is determined by the relevant ECCN. Arm will prov=
ide ECCNs for licensed products upon request to tradecompliance@arm.com. Yo=
u are responsible for determining the jurisdiction and classification of th=
e designs you create using Arm Confidential Information, Arm Tools or other=
 Arm products. Arm Confidential Information, Arm Tools or other Arm product=
s provided under this Licensee are dual-use, and are not listed on the UK M=
ilitary List, nor are they subject to the International Traffic in Arms Reg=
ulations (ITAR), the 600 Series of the EAR or other military export control=
 regimes. The parties are prohibited from sharing ITAR-controlled technical=
 data, 600 series-controlled technology, other export controlled military d=
ata, or any other data that might require an export license or other export=
 authorisation without prior written consent from the other party. Further,=
 Arm is expressly authorised to use non-U.S. citizens for the performance o=
f this License with the exception of nationals of Country Group E:1 and E:2=
 as listed in Supp. 1 to Part 740 of the EAR, which shall only be permitted=
 in full compliance with all applicable laws.
+
+13.7    All notices which are required to be given hereunder must be in En=
glish and in writing and must be delivered: (i) personally to the other par=
ty's employee with the authority to accept such delivery (in which case it =
will be deemed served immediately), (ii) by first class post (in which case=
 it will be deemed served on the third business day after it was posted) to=
 the Notice Address (as defined below), or (iii) by registered commercial c=
ourier (in which case it will be deemed served on the second business day a=
fter deposit with the courier) to the Notice Address (as defined below). Th=
is clause shall not apply to the service of any proceedings or other docume=
nts in a legal action. The "Notice Address" for the purposes of sub-clauses=
 (ii) and (iii) above means 150 Rose Orchard Way, San Jose, CA 95134, Atten=
tion: General Counsel. To be effective, any notice delivered pursuant to su=
b-clauses (i), (ii), or (iii) of this clause 13.7 must also be emailed to l=
itigation@arm.com no later than twenty-four (24) hours after the notice is =
deemed served.
+
+Arm Document Reference LES-PRE-21260, Version 12.4, Effective Date 22.01.2=
021
=20
-12.4 Subject to clause 10.1(b), neither this License or any rights granted=
 to you under it may be assigned, sub-licensed or otherwise transferred by =
you to any third party without the prior written consent of Arm. An assignm=
ent shall be deemed to include, without limitation (i) any transaction or s=
eries of transactions whereby a third party acquires, directly or indirectl=
y, the power to control the management and policies of you, whether through=
 the acquisition of voting securities, by contract or otherwise; and (ii) t=
he sale of more than fifty percent (50%) of your assets whether in a single=
 transaction or series of transactions. Notwithstanding the foregoing, Arm =
may, in its discretion acting reasonably, separately agree to authorise the=
 re-host of a Licensed Seat (for which additional charges may apply).
=20
-12.5 Subject to any applicable legal restrictions, including but not limit=
ed to those relating to the security of classified information, at Arm's re=
quest, (i) you agree to check your computers for installations of the Arm T=
ools, copies of License Keys, contents of any license server log files, ind=
ividual or concurrent usage of Seats, and any other information requested b=
y Arm relating to Arm Tools installation, usage and License Key management,=
 and, to provide this information to Arm; and (ii) you agree that Arm may i=
nstruct appropriately qualified independent auditors to perform such checks=
 by prior appointment during your normal business hours on reasonable notic=
e. In respect of any audit, Arm shall bear the auditors' costs for that aud=
it unless it reveals unlicensed usage, in which case you shall promptly rei=
mburse Arm for all reasonable costs and expenses, including professional fe=
es, relating to such audit. Any information which is disclosed to Arm or su=
ch auditors during checking or audit shall be treated as your confidential =
information and shall only be used by Arm for compliance and enforcement pu=
rposes.
=20
-12.6 The Arm Tools provided under this License are subject to U.S. export =
control laws, including the U.S. Export Administration Act and its associat=
ed regulations, and may be subject to export or import regulations in other=
 countries. You agree to comply fully with all laws and regulations of the =
United States and other countries ("Export Laws") to ensure that the Arm To=
ols are not (i) exported, directly or indirectly, in violation of Export La=
ws, either to any countries that are subject to U.S. export restrictions or=
 to any end user who has been prohibited from participating in the U.S expo=
rt transactions by any federal agency of the U.S. government; or (ii) inten=
ded to be used for any purpose prohibited by Export Laws, including, withou=
t limitation, nuclear, chemical, or biological weapons proliferation.
=20
-Arm Document Reference LES-PRE-21260, Version 12.2, Effective Date 12 Febr=
uary 2019
diff --git a/meta-arm-toolchain/custom-licenses/Armcompiler-Redistributable=
s b/meta-arm-toolchain/custom-licenses/Armcompiler-Redistributables
index aa2070be..75cf9372 100644
--- a/meta-arm-toolchain/custom-licenses/Armcompiler-Redistributables
+++ b/meta-arm-toolchain/custom-licenses/Armcompiler-Redistributables
@@ -1,19 +1,19 @@
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
-This file lists the portions of this release of 'Arm Compiler 6' that you =
are
-permitted to redistribute and any terms and conditions applicable to such
-redistribution. Refer to the End User License Agreement that accompanies t=
his
-release of 'Arm Compiler 6' for terms and conditions relating to permitted
-redistribution and 'Redistributables'. Any modification or redistribution =
of
-files covered by open-source licenses, whether listed here or not, is subj=
ect
-to the terms of the applicable open-source license.
+This file lists the portions of this release of 'Arm Compiler for Embedded=
 6'
+that you are permitted to redistribute and any terms and conditions applic=
able
+to such redistribution. Refer to the End User License Agreement that accom=
panies
+this release of 'Arm Compiler for Embedded 6' for terms and conditions rel=
ating
+to permitted redistribution and 'Redistributables'. Any modification or
+redistribution of files covered by open-source licenses, whether listed he=
re or
+not, is subject to the terms of the applicable open-source license.
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
=20
 1) Target Libraries(libraries and helper libraries): Redistribution permit=
ted
-only in object code form, compiled and linked by Arm Compiler in to Softwa=
re
-Applications developed by you or your permitted users, provided that Softw=
are
-Applications contain substantial additional functionality. If you choose to
-redistribute the whole or any part of Target Libraries, you agree: (a) to
-ensure that they are licensed for use only as part of Software Applications
+only in object code form, compiled and linked by Arm Compiler for Embedded=
 in to
+Software Applications developed by you or your permitted users, provided t=
hat
+Software Applications contain substantial additional functionality. If you
+choose to redistribute the whole or any part of Target Libraries, you agre=
e: (a)
+to ensure that they are licensed for use only as part of Software Applicat=
ions
 and only for execution on microprocessors manufactured or simulated under
 licence from Arm; (b) not to use Arm's or any of its licensors names, logo=
s or
 trademarks to market Software Applications; (c) to include valid copyright
@@ -29,7 +29,7 @@ support libraries; Maths libraries; Software floating-poi=
nt libraries; VFP
 support found in your installation in armlib and libcxx subdirectories at
 <install_dir>\lib
=20
-b) Helper libraries: ARM Compiler 6 helper libraries found in your
+b) Helper libraries: Arm Compiler for Embedded 6 helper libraries found in=
 your
 installation at <install_dir>\lib\armlib\h_*
=20
 ---------------------------------------------------------------------
diff --git a/meta-arm-toolchain/custom-licenses/Armcompiler-Supplementary-t=
erms b/meta-arm-toolchain/custom-licenses/Armcompiler-Supplementary-terms
index 3ffc422d..6b828caf 100644
--- a/meta-arm-toolchain/custom-licenses/Armcompiler-Supplementary-terms
+++ b/meta-arm-toolchain/custom-licenses/Armcompiler-Supplementary-terms
@@ -1,10 +1,10 @@
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
 This file contains details of any applicable specific extensions, limitati=
ons
 or other variations to the terms of the End User License Agreement that
-accompanies this release of 'Arm Compiler 6'.
+accompanies this release of 'Arm Compiler for Embedded 6'.
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
=20
 There are no 'Supplementary Terms' applicable to this release of
-'Arm Compiler 6'.
+'Arm Compiler for Embedded 6'.
 ---------------------------------------------------------------------
 END OF FILE: supplementary_terms.txt
diff --git a/meta-arm-toolchain/custom-licenses/Armcompiler-Third-party-lic=
enses b/meta-arm-toolchain/custom-licenses/Armcompiler-Third-party-licenses
index 3a8d2ec6..55b78e5c 100644
--- a/meta-arm-toolchain/custom-licenses/Armcompiler-Third-party-licenses
+++ b/meta-arm-toolchain/custom-licenses/Armcompiler-Third-party-licenses
@@ -1,9 +1,9 @@
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
-This file lists the package level copyright and license information for th=
ird=20
-party software included in this release of 'Arm Compiler 6'. Refer to the=
=20
-License Agreement (End User License Agreement (EULA)) that accompanies thi=
s=20
-release of 'Arm Compiler 6' for terms and conditions relating to your use =
of=20
-such third party software.
+This file lists the package level copyright and license information for th=
ird
+party software included in this release of 'Arm Compiler for Embedded 6'. =
Refer
+to the License Agreement (End User License Agreement (EULA)) that accompan=
ies
+this release of 'Arm Compiler for Embedded 6' for terms and conditions rel=
ating
+to your use of such third party software.
=20
 The information is grouped into two sections. The first section lists out
 details of third party software projects, including names of the applicable
@@ -15,7 +15,7 @@ first section.
 SECTION 1: THIRD PARTY SOFTWARE PROJECTS
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
=20
-Name:         Clang #7ff9a93
+Name:         Clang #368af75
 Summary:      C/C++ language frontend for LLVM.
 Home-page:    https://clang.llvm.org/
 License(s):   'Apache License v2.0 with LLVM Exception' and portions with =
legacy=20
@@ -25,7 +25,7 @@ Copyright(s): (For legacy licensed portions) Copyright (c=
) 2007-2019 University
               of Illinois at Urbana-Champaign. All rights reserved.
               (For portions modified by Arm Limited) Modifications Copyrig=
ht (C)=20
               Arm Limited (or its affiliates). All rights reserved.
-Source(s):    https://github.com/llvm/llvm-project/tree/7ff9a93/clang
+Source(s):    https://github.com/llvm/llvm-project/tree/368af75/clang
 ---------------------------------------------------------------------
=20
 Name:         fdlibm (1993)
@@ -36,7 +36,7 @@ License(s):   Custom (MIT like). See later section for a =
copy of license text.
 Copyright(s): Copyright (C) 1993 by Sun Microsystems, Inc. All rights rese=
rved.
 ---------------------------------------------------------------------
=20
-Name:         libc++ #7ff9a93
+Name:         libc++ #368af75
 Summary:      The LLVM implementation of the C++ standard library.
 Home-page:    https://libcxx.llvm.org/
 License(s):   'Apache License v2.0 with LLVM Exception' and portions with =
legacy=20
@@ -48,10 +48,10 @@ Copyright(s): (For legacy licensed portions) Copyright =
(c) 2009-2019 by the
               Copyright (c) 2009-2014 by the contributors listed in CREDIT=
S.TXT.
               (For portions modified by Arm Limited) Modifications Copyrig=
ht (C)=20
               Arm Limited (or its affiliates). All rights reserved.
-Source(s):    https://github.com/llvm/llvm-project/tree/7ff9a93/libcxx
+Source(s):    https://github.com/llvm/llvm-project/tree/368af75/libcxx
 ---------------------------------------------------------------------
=20
-Name:         libc++abi #7ff9a93
+Name:         libc++abi #368af75
 Summary:      C++ ABI runtime support library from the LLVM project.
 Home-page:    https://libcxxabi.llvm.org/
 License(s):   'Apache License v2.0 with LLVM Exception' and portions with =
legacy=20
@@ -63,10 +63,10 @@ Copyright(s): (For legacy licensed portions) Copyright =
(c) 2009-2019 by the
               Copyright (c) 2009-2014 by the contributors listed in CREDIT=
S.TXT.
               (For portions modified by Arm Limited) Modifications Copyrig=
ht (C)=20
               Arm Limited (or its affiliates). All rights reserved.
-Source(s):    https://github.com/llvm/llvm-project/tree/7ff9a93/libcxxabi
+Source(s):    https://github.com/llvm/llvm-project/tree/368af75/libcxxabi
 ---------------------------------------------------------------------
=20
-Name:         libunwind #7ff9a93
+Name:         libunwind #368af75
 Summary:      C++ exception unwind library from the LLVM project. Library =
to=20
               determine the call-chain of a program..
 Home-page:    https://github.com/llvm-mirror/libunwind
@@ -79,24 +79,28 @@ Copyright(s): (For legacy licensed portions) Copyright =
(c) 2009-2019 by the
               Copyright (c) 2009-2014 by the contributors listed in CREDIT=
S.TXT.
               (For portions modified by Arm Limited) Modifications Copyrig=
ht (C)=20
               Arm Limited (or its affiliates). All rights reserved.
-Source(s):    https://github.com/llvm/llvm-project/tree/7ff9a93/libunwind=
=20=20=20=20=20=20=20=20
+Source(s):    https://github.com/llvm/llvm-project/tree/368af75/libunwind
+Note:         The included license file refers to CREDITS.TXT in its Copyr=
ight
+              statement. However, the provider of libunwind, the LLVM proj=
ect,
+              has not included the referenced CREDITS.TXT file in the
+              aforementioned source repository.
 ---------------------------------------------------------------------
=20
-Name:         libxml2 v2.7.7
+Name:         libxml2 v2.9.9
 Summary:      XML C parsing library.
 Home-page:    http://www.xmlsoft.org/
-License(s):   a) X11 License (X11); AND b) MIT License (MIT). See later se=
ction=20
+License(s):   a) X11 License (X11); AND b) MIT License (MIT). See later se=
ction
               for a copy of license text.
 Copyright(s): Copyright (C) 1998-2003 Daniel Veillard.  All Rights Reserve=
d.
               Copyright (C) 2000 Bjorn Reese and Daniel Veillard.
               Copyright (C) 2000 Gary Pennington and Daniel Veillard.
               Copyright (C) 1998, 2000, 2001 Bjorn Reese and Daniel Stenbe=
rg.
               Copyright (C) 2001 Bjorn Reese <breese@users.sourceforge.net>
-              For full list, please refer to Source(s).=20
+              For full list, please refer to Source(s).
 Source(s):    ftp://xmlsoft.org/libxml2/
 ---------------------------------------------------------------------
=20
-Name:         LLVM #7ff9a93
+Name:         LLVM #368af75
 Summary:      The LLVM Project is a collection of modular and reusable com=
piler=20
               and toolchain technologies. The LLVM Core libraries provide =
a=20
               modern source- and target-independent optimizer, along with =
code=20
@@ -115,12 +119,12 @@ Copyright(s): (For legacy licensed portions) Copyrigh=
t (c) 2003-2019 University
               Copyright 2001-2004 Unicode, Inc.
               (For portions modified by Arm Limited) Modifications Copyrig=
ht (C)=20
               Arm Limited (or its affiliates). All rights reserved.
-Source(s):    https://github.com/llvm/llvm-project/tree/7ff9a93/llvm
+Source(s):    https://github.com/llvm/llvm-project/tree/368af75/llvm
 ---------------------------------------------------------------------
=20
 Name:         glibc v2.12 (Linux OS only)
 Summary:      The GNU C Library. GNU C library (glibc) is dynamically link=
ed to=20
-              Arm Compiler for running on Linux Systems.
+              Arm Compiler for Embedded for running on Linux Systems.
 Home-page:    https://www.gnu.org/software/libc/
 License(s):   GNU Lesser General Public License v2.1 or later(LGPL-2.1-or-=
later)
               See later section for a copy of license text.
@@ -214,28 +218,15 @@ Copyright(s): Copyright (c) 2000, 2004-2007, 2009 App=
le Inc. All rights reserved
 Source(s):    https://opensource.apple.com/source/Libc/Libc-1244.50.9/
 ---------------------------------------------------------------------
=20
-Name:         libiconv v51.50.1 (Mac OS only)
+Name:         libiconv v1.15
 Summary:      iconv - Unicode character set conversion library.
 Home-page:    https://www.gnu.org/software/libiconv/
 License(s):   GNU Library General Public License v2 or later (LGPL-2.0-or-=
later)
               See later section for a copy of license text.
-Copyright(s): Copyright (C) 1999-2001 Free Software Foundation, Inc.
-              For full list, please refer to Source(s).=20
-Source(s):=20=20=20=20
-        https://opensource.apple.com/source/libiconv/libiconv-51.50.1/libi=
conv/
----------------------------------------------------------------------
-
-Name:         Boost 1.57
-Summary:      Boost C++ libraries
-Home-page:    https://www.boost.org/
-License(s):   Boost Software License 1.0=20
-              See later section for a copy of license text.
-Copyright(s): Copyright 1997, 1998, 1999, 2000 University of Notre Dame.
-              Copyright 2002 Indiana University.
-              Copyright 2001 University of Notre Dame.
-              Copyright 2003 Jeremy Siek.
-              For full list, please refer to Source(s).=20
-Source(s):    http://sourceforge.net/projects/boost/files/boost/1.57.0/
+Copyright(s): Copyright (C) 1999-2017 Free Software Foundation, Inc.
+              For full list, please refer to Source(s).
+Source(s):
+              https://ftp.gnu.org/gnu/libiconv/libiconv-1.15.tar.gz
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
=20
 SECTION 2: APPLICABLE LICENSES
@@ -3005,8 +2996,8 @@ California, except that body of California law concer=
ning conflicts of law.
=20
 Where You are located in the province of Quebec, Canada, the following cla=
use
 applies:  The parties hereby confirm that they have requested that this Li=
cense
-and all related documents be drafted in English. Les parties ont exig=EF=
=BF=BD que le
-pr=EF=BF=BDsent contrat et tous les documents connexes soient r=EF=BF=BDdi=
g=EF=BF=BDs en anglais.=20
+and all related documents be drafted in English. Les parties ont exigi?? q=
ue le
+pri??sent contrat et tous les documents connexes soient ri??digi??s en ang=
lais.=20
=20
 EXHIBIT A.=20
=20
@@ -3916,32 +3907,5 @@ necessary.  Here is a sample; alter the names:
   Ty Coon, President of Vice
=20
 That's all there is to it!
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
-
-13) License Text for 'Boost' (Boost Software License 1.0):
-
-Boost Software License - Version 1.0 - August 17th, 2003
-
-Permission is hereby granted, free of charge, to any person or organization
-obtaining a copy of the software and accompanying documentation covered by
-this license (the "Software") to use, reproduce, display, distribute,
-execute, and transmit the Software, and to prepare derivative works of the
-Software, and to permit third-parties to whom the Software is furnished to
-do so, all subject to the following:
-
-The copyright notices in the Software and this entire statement, including
-the above license grant, this restriction and the following disclaimer,
-must be included in all copies of the Software, in whole or in part, and
-all derivative works of the Software, unless such copies or derivative
-works are solely in the form of machine-executable object code generated by
-a source language processor.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
-SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
-FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
-ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-DEALINGS IN THE SOFTWARE.
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
 END OF FILE: third_party_licenses.txt
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm=
compiler_6.16.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolcha=
in/armcompiler_6.17.bb
similarity index 89%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armc=
ompiler_6.16.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcom=
piler_6.17.bb
index e1d5cc38..bbd305bc 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompile=
r_6.16.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompile=
r_6.17.bb
@@ -21,17 +21,17 @@ LICENSE =3D "Armcompiler-License-agreement & Armcompile=
r-Redistributables & \
 LICENSE_FLAGS =3D "armcompiler"
=20
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D19f=
af912b534478d28f60dfa24659c17 \
-                    file://license_terms/redistributables.txt;md5=3De510e4=
7f7f5be1356ea6218f5b1f6c55 \
-                    file://license_terms/supplementary_terms.txt;md5=3D17a=
2efdbd320ceda48a3521747e02dd9 \
-                    file://license_terms/third_party_licenses.txt;md5=3Dc3=
51a9bed613cf88d4fccd6f0a5e57af "
+                    file://license_terms/redistributables.txt;md5=3Dc22d8d=
2388d8e592f4b135f87bb243da \
+                    file://license_terms/supplementary_terms.txt;md5=3De24=
43a4a7c520e79ebb603c8ba509076 \
+                    file://license_terms/third_party_licenses.txt;md5=3D53=
b42e7d31259bdc174b9c03651ed1b7 "
=20
-ARMCLANG_VERSION =3D "DS500-BN-00026-r5p0-18rel0"
+ARMCLANG_VERSION =3D "DS500-BN-00026-r5p0-19rel0"
=20
 COMPATIBLE_HOST =3D "x86_64.*-linux"
=20
 SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/compiler/${=
ARMCLANG_VERSION}.tgz;subdir=3D${ARMCLANG_VERSION} \
            file://no-uname.patch"
-SRC_URI[sha256sum] =3D "d9fb99e7550366f884c31f74953066da64301fb30601cb5527=
8d738459c22557"
+SRC_URI[sha256sum] =3D "0ed2c3a2e416f07b892250fcbcca4b27353b046a030a433bf6=
dddc0db802885c"
=20
 UPSTREAM_CHECK_URI =3D "https://developer.arm.com/tools-and-software/embed=
ded/arm-compiler/downloads/"
 UPSTREAM_CHECK_REGEX =3D "Download Arm Compiler.*,(?P<pver>[\d\.]+)"
--=20
2.25.1


