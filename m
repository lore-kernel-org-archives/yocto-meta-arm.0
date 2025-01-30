Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B747AC0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 15:35:20 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.18078.1738251315665309142
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jan 2025 07:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ayTLL9c1;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso959319e87.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Jan 2025 07:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738251314; x=1738856114; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E86CcozagmLsYaKrTI35C23FsWAcVJRx2zN2PM6uAWY=;
        b=ayTLL9c16fEAypIC8P2b6Nfn7tix/4qFXeY1p78tGE+fR9dlrmj1z8zUE6Dor+qEZW
         LGa5fiwzHgj5G/1vECa/tWfpDjzYnpvr21PwQPwa1mlU89PY3W/sXZCSgm7ug1k10skj
         d8H5y+nD4bNRsZ4jCxxTaXPe8RvzKoIz5p9o6B/BsN9PxnlQAZiV0p0ZRPqryd8WAeVi
         EutRhIc4OkY+X3TcqJ80PkztW2dnWDq7W6EbLDw/6o427RaeDGcRZcpf8fs2/aLO6UJx
         vaUkVAD/8rTD6OpFYugA3AF121Y9NzT2rVmbcSMnPBP8TBbbal3kO+iheQBl6tnyYDCW
         vPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738251314; x=1738856114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E86CcozagmLsYaKrTI35C23FsWAcVJRx2zN2PM6uAWY=;
        b=eBdkxLHvlOH/grr0sgbvb8kOh5SgiqF6WDYP0iSxESQ3MUIaZ9ZBfccNOkkqMynMQe
         b7L4BaKT2YqD9vhzGFQ1FXW6bm0J5gNmS93T1ZlZKWTfAQ6820SKPQL5LDu4C3Rs400i
         sK1pyncq7ges/ENwsTtVnb9H/cWjvWJqTspUE7VuT9tuHsXRwZs+ZsFoKc8kPr+F0eM6
         g1rp2fqRufJmj4O2opnvwRjFzjwyJ6+tXN18mN+YzXiepetahEzR4JTG6Jrz0KfOIBDi
         8B1h2Bwug/TKm/8b+PscINMY+XmZbdZ39+qZuxUVswghbTpYu/kBneuI+qmknod+F2GL
         cvYg==
X-Gm-Message-State: AOJu0Yw9ggdiNJnKi73b5xH/Y0JorRrh6YbkvvieTawFFocWkS9trmxv
	5QDOg4MZ5PEkyoTcKXG0BJoAO9hgo3UOGePdEiodKiLnFICQg2V088nYKgWX5NM=
X-Gm-Gg: ASbGncuORMFiCKYrtMN5bTBqlTjw7o/lq0m9hhN0lGXbZHdx+6I3nLcNjj+tRY+P7X9
	9zv8KRSQF9uYpDsqFCAaBEJm7V+BazLgz3J86d8nLUdVQuKUjCukV90SZaU8mnU7ZmsRdhUrD6J
	wSNHA1sU34SnS3YfxUn6XTTH6/86TTcfPUXFsbypG9MXQtw36w6FBSkQGzzvIYo+tJ4k2NpEgqK
	9ofnhHZBagk2COEcN9PhXM8jde4BNA08YojXZjYXuI7sr+uRXQvTTcv8nIL4vUhPjoFCkEOYVT9
	dyP+VGL2h+t8em3F4H178zcYJhHYe0PFC6M9J1phpoBplnyyXf7FEREnciDs
X-Google-Smtp-Source: AGHT+IEWpCLU1/4xd6Hv6t2GMKP2hii0HL+IL8Qm+wO4A3BbmazuO1oPvrS0pevmXXQwnvfmg4ZaXg==
X-Received: by 2002:a05:6512:3a8e:b0:542:8d45:cb3e with SMTP id 2adb3069b0e04-543e4beb1d2mr2673878e87.18.1738251313788;
        Thu, 30 Jan 2025 07:35:13 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebecc3sm186125e87.242.2025.01.30.07.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 07:35:12 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: meta-arm@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/3] uki.bbclass: capture ukify command stdout and stderr
Date: Thu, 30 Jan 2025 17:34:34 +0200
Message-ID: <20250130153435.1074941-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250130153435.1074941-1-mikko.rapeli@linaro.org>
References: <181F17E3A23753E5.21193@lists.yoctoproject.org>
 <20250130153435.1074941-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Jan 2025 15:35:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6361

ukify tool can show important warnings and even errors
if it fails so capture the logs.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/uki.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index 92f690526d..ccda042ab4 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -190,6 +190,7 @@ python do_uki() {
 
     # Run the ukify command
     bb.debug(2, "uki: running command: %s" % (ukify_cmd))
-    bb.process.run(ukify_cmd, shell=True)
+    out, err = bb.process.run(ukify_cmd, shell=True)
+    bb.debug(2, "%s\n%s" % (out, err))
 }
 addtask uki after do_rootfs before do_deploy do_image_complete do_image_wic
-- 
2.43.0


