Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88387C433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 16:59:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.2.1643129988198619699
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Jan 2022 08:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 867621063
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Jan 2022 08:59:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 321EB3F766
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Jan 2022 08:59:47 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] scripts/machine-summary: don't mark denied patches as
 good
Date: Tue, 25 Jan 2022 16:59:34 +0000
Message-Id: <20220125165936.1456059-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125165936.1456059-1-ross.burton@arm.com>
References: <20220125165936.1456059-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Jan 2022 16:59:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2909

A patch in denied state isn't good, it's bad.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/report-details.html.jinja | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/report-details.html.jinja b/scripts/report-details.h=
tml.jinja
index ba66fcf0..19ede510 100644
--- a/scripts/report-details.html.jinja
+++ b/scripts/report-details.html.jinja
@@ -6,9 +6,9 @@
   {% set status =3D status.split()[0] %}
   {% if status in ("Unknown", "Pending") %}
     {% set class =3D "is-danger" %}
-  {% elif status in ("Backport", "Accepted", "Inappropriate") %}
+  {% elif status in ("Backport", "Accepted", "Inappropriate", "Denied") =
%}
     {% set class =3D "is-success" %}
-  {% elif status in ("Submitted", "Denied") %}
+  {% elif status in ("Submitted",) %}
     {% set class =3D "is-info" %}
   {% else %}
     {% set class =3D "is-info" %}
--=20
2.25.1


