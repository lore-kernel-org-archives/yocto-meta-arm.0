Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F08ACA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 12:51:55 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.15866.1757681514496256717
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 05:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=3OrO9Mwi;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-722d5d8fa11so15059436d6.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 05:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1757681513; x=1758286313; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fO7KY4RSgNSHhiDByokO/zdSWtSAnfIOkaP3vg0gkfI=;
        b=3OrO9Mwi+PeuSJGiHZmZES6Vjlo7HJ2KjS+EXoKYGm1KaDuGB6uIaNw/iTC5fH7YhR
         uS2hLu4SisDRyjfRHqRJELNe8rE7buXm4VxBetPvrmCOSkOxfGLtjbPpcqicHqB+WZQf
         UiWO4G7HcR7/SjEGa3eY2zLUrSjp7uaRnX7hAXRkGHZBZBlaN56oTRBDG0LqF+TtKn7g
         np8KAJgCMAxIuOVp54nl/GneWagAaTGhJp7CQEKBL45IqsqF2T6JXUsbTHi+hj2x0IUJ
         Hr7h0p2EBOoqmtsnxZzpSTr6ve3ZFdN48lqAnLa5EW9pVaG7Asx1kAjW1gd35vRpJUlM
         potw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757681513; x=1758286313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fO7KY4RSgNSHhiDByokO/zdSWtSAnfIOkaP3vg0gkfI=;
        b=k1W1yTRLpuRrlUMj+ezIL7qLISz1SqRF7lmZ1wTBO8b/lN9gt+RUdKeIt7FiJ/qLky
         q1TKt7l2M9IiSLQ9UFPmsviZzNvNA+UckuuqbnC/uJtuJRPYzKXdknvoM2gh10iHzovL
         Y9VxdHMKGYE6Qan/cHxmaHSshYtLLqhRQOSZ02yeIAMDmNbM+8vYbsjA8qEOFWaja2tA
         WFbKxPtez5d2js7bvODplKziLvoCpA54EWV/VD9qDG1UCTgemsyA97N4jldur9RodI22
         dloaX6C91RC/6dOEbaKbX3qkqpIa/y8MlGFL4WwRgsTy3A8lrAwHPw8qo0AqRb3RvtKv
         iq2A==
X-Gm-Message-State: AOJu0Yz0cSLGN+GBeRpVWyShGgAbcO/REzAt97P9fDo/zhYVffTeYyKH
	Q1bbxeNlKg2H+ytWeGDpSDsRl/CFKoyPo37JVS2GQZ+4VRuLwogz/ZPM+N7IjqcOuZNUWbnPL9b
	U8hE=
X-Gm-Gg: ASbGnctj/GHrAauAIKd9zas6UynA2ZdgsPfbh/dXdT2mh1OEsiZtv0G0bgaxOs6AFta
	o03GMq218DF2/lwp568JWg3rfs/6n8xrLP2i2xK0e98+SxW+OJRH1Yj22cwf4cM1xZ85vtHbxlH
	D6q8basXBdHbUzZv2kWYYXnKxbdlm8iq8KO2vXUZ3ZTbwmkfiO9wK7gl0EIGwU+xWzZF0EraVfm
	b2qvb8bpelk6J7fNgJm/KQLsjIdRo6LcryssOH7A+JTBn2a40cCfNRURR2Qu/rP4ol/ME9iRoKO
	N36NWHR4GGKfh+8khZCaeZgKGpqfZmPM6rZ1074aydd69UfEEb4KuZcTXAcHA5ZgY7UwlxRnI0j
	g/JgM5HiWS+tPhA==
X-Google-Smtp-Source: AGHT+IGlKXufDhsB8fgXNWMX7qayeFm5UTDqyW8xVNrpt4ckTZDB3+WDem+HAHPxhIAsv8h1walR+w==
X-Received: by 2002:a05:6214:d6a:b0:721:f7b4:25c8 with SMTP id 6a1803df08f44-767c3a54bb8mr31882766d6.52.1757681513260;
        Fri, 12 Sep 2025 05:51:53 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-763b431c7ccsm26804516d6.4.2025.09.12.05.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 05:51:52 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] ci/selftest: remove rm_work
Date: Fri, 12 Sep 2025 08:49:25 -0400
Message-Id: <175768136749.537781.1705964031318154292.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911122201.35040-1-jon.mason@arm.com>
References: <20250911122201.35040-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 12:51:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6703


On Thu, 11 Sep 2025 08:22:01 -0400, Jon Mason wrote:
> oe-selftest is now logging having rm_work enabled as an error, which is
> causing the test to fail.  Remove this from the selftest.yml file, and
> everything works as before.
> 
> 

Applied, thanks!

[1/1] ci/selftest: remove rm_work
      commit: c76567dc613f285edf00887195a1a6d6248b4f7a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

