Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDE4C3601B
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 03:33:51 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.5173.1743564825012118666
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Apr 2025 20:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=gqZtHqG1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c08f9d0ef3so368459685a.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 01 Apr 2025 20:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1743564824; x=1744169624; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzkzPttKBytKZW2ZANfCkmeho0UozbPJtYiMp2FvEok=;
        b=gqZtHqG1xPL3kRNjqR43+PmY2DIuvsM9GXUW0hj/SXPL+LBa+K6q25m+rlScmximcP
         2avpbd4DcgTguXozI4ojNpwC9K1M7oaIKC2ShbNqIXg6B8oea/8tjp+hg0CBq6Eagjcv
         HKapnna004Up+94GBZijvPqps9IyHXS9HI8IVE8WXmQeTCRp5D5/ikwgulmEVWT4/OWd
         BigzEK+/3ObOqiUj/T6Cd83OKaDmIuTQPLh6q4xAGWR+bre6kBjaRCozEOTggXh0OZWu
         qy8GVuSoBgwyNJRsiNmiv//EfkuASDLPdXyPNreTQdE9XfdyI+ezwa91xp80eBCWDKVM
         2vCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743564824; x=1744169624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzkzPttKBytKZW2ZANfCkmeho0UozbPJtYiMp2FvEok=;
        b=hAbR1cLjJhOVkVcoAv+X4mUoUet8tiFq5VpmRhIRFKhqposetohOwbWBmTqQ0k7TDh
         767OL1MR5spTltR5dlh8kh3eZLh+WTqZDME8MeVb2+jkjn0v0DPQuKhuP7AAbg80VEkS
         rUiu74sorraKTVnrcSRu89nOzqE5JzfMcizaSDFoDoqUf1kAV3cSy3JpGz7eoWCAVjOM
         SbmoyEySPbsPCGFWsEmvREktB08MLSiBoHP6vc2ogbLifvDaDm0gECBC9UiiNZ/3Ge67
         oZer5/qRp2j0cUi/VOcgrCfyzc2tGq/KB/U6SlCUGseqjmy5diu6YTYC0Lg8QY9Jvfgh
         M32g==
X-Gm-Message-State: AOJu0YxFK3II3d+EING4MPMj7zEeS+bR1AB3AUqYo3xq/xlY48NXJ/4p
	lIyYNMQGIT4FdZ6pwwSs8Gjlwi/tyIz66FKd0W/oMMQ67xloSBT57IAnZSHxWFx7j0lwZYE9GrN
	/2g==
X-Gm-Gg: ASbGnctt7n0JiqSGLZMBl9TiZUxwZKB6V4M9/fXiCQz5gsZhuwxDjC6mzeq6AutVQOP
	EGoaJYI1R6AyWJMDPIzzQu2/J7eBMDmyvkmtgEglDNyJnkX8sq/Sn6mRAT3LaZbE3PFxrxJzdRf
	i1N0qTnNde6tRmSgXSMwbrva3ta7wdGAxyzxTmIqIaKBk9JsYuXQKKvPP9yzrchNQFw97rsvZrN
	lJlC63+gWZFc8B2oZw0yUIM4UuCp9XhLrZRa3hAm1JTs5AQaeZmhPWKBi0QL0UIrnRisSQeGmIv
	+B9/Zhqk0uGdDE2nLP8XYcsQ4AcxuyZQXQUW0ILArgLMixQ=
X-Google-Smtp-Source: AGHT+IFjh4hdSmg+ss80WTemvqszoWyCC0rZ4tpcATbRTuihIOK7m0XcMM78W1jU0DWKk0BfeXajJQ==
X-Received: by 2002:a05:620a:288a:b0:7c5:a55f:63b6 with SMTP id af79cd13be357-7c6866e1229mr1986150885a.14.1743564823770;
        Tue, 01 Apr 2025 20:33:43 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f76a6ee8sm737986185a.50.2025.04.01.20.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 20:33:43 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/3] CI: always save the lockfile.yml in update-repos
Date: Tue,  1 Apr 2025 23:33:17 -0400
Message-Id: <174356479871.2646952.1134092102857446355.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401130909.2924629-1-ross.burton@arm.com>
References: <20250401130909.2924629-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Apr 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6433


On Tue, 01 Apr 2025 14:09:07 +0100, Ross Burton wrote:
> The update-repos job can "fail with warnings" if the reference repository
> fetch fails. This is intentionally a warning as the CI may have set
> KAS_PREMIRRORS and a stale cache is fine.
> 
> However, by default artifacts are only saved on successful jobs, so if
> this happens the lockfile.yml isn't saved. Ensure the artifacts are
> always saved so the rest of the pipeline is successful.
> 
> [...]

Applied, thanks!

[1/3] CI: always save the lockfile.yml in update-repos
      commit: c8da42d7bd3dfcdd89d639db83adbb1ae656b437
[2/3] CI: disable KAS_REPO_REF_DIR by default
      commit: 9b92d080b156cc0adb5d6fe3870bd488faddca61
[3/3] CI: dump all environment variables in update-repos
      commit: 2cc1cd16ab943a9f6317ea165d193f5668694096

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

