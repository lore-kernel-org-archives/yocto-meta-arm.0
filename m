Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4D5C369AB
	for <webhook@archiver.kernel.org>; Sat, 19 Apr 2025 03:15:49 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.346.1745032545813343890
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Apr 2025 20:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=pfQiOS83;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-6e8f43c1fa0so29276526d6.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 20:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1745032544; x=1745637344; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoMphvZfF+LdCcAIPzQwtNtwdGuzDEjOwhel8avmAlQ=;
        b=pfQiOS83f5c34LW4Ibm0zc2/U6PRGhYqDnvJSOpMNvVHpCGvKiLt3+MjVcq4QGQx/S
         R0TxBD1z7dVK2ArR5VHsJcSlPq9E+1T7J6T77GIPQoBPfr4nr4+3QygNYHEd03DTWNxO
         N9GFczvH1ypffaRW7Yl6XxOmvY59oDT4M+H9Pn0Ftj+YpjG5rleBA8V1ZbDSVLDXGd5e
         Nlz4gpNSwJ+JYz0fzbcQYXuE+r7ynudpdeWZH4EaXrNwyAJAAghryjBb/Z05mwg4Blq+
         JY+D4McFnSVdsmd+9YJ+w7ov/us83qMC8zE7n539SaPxk9zNQfL46j183vShCzIuWkre
         lEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745032544; x=1745637344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qoMphvZfF+LdCcAIPzQwtNtwdGuzDEjOwhel8avmAlQ=;
        b=xEtomJ7VhR6OrkfRT8DewRZDBKKqDIb39Ao4zlei3yy8/5UYPAbgdRB5HJ/rcPYxS1
         P0BMszaL9CKWqqmujFPVJihb9YMBojdvAUeGBS1ke2GUOyDzmh2iwzUyix2RRGGxG3hG
         5krXFNqp9dFUfb60XKfHVLBUOKFUEh7voDZbwCa7G2wD1WKR4F/SS8yibEMNQwK7iXM/
         AmF6drI1C+hKneNsDOLzwnmioAyjq/N+VIvpVsik2t78xBLmhSWdgA+NcoDta0IpYJNM
         jZZlIpdYQ6NnQSqkSBe+w5AbFDs/aDVclNePk9v7+a7tVXIDl/WAi1NFcK0k+wbussDJ
         jqYw==
X-Gm-Message-State: AOJu0YyTsiaV9i8zQVSgaLGuxQv1EX6li3o1MXRsfij/wa5dOrLapszK
	tJL1uOoHk0dcI+BO3NVLEDAEUg0izzmoZ2rD8n65mkdF8erQ+B9fBn2xG88eoTg78qnKMSFyCFW
	c13cK
X-Gm-Gg: ASbGncsd3vhTaoRciz7yapBibmcdEEkaBHrcH6q9GFoqTd7WTo7CPVPK4SRqSVGpzvE
	Dz3tj47HIvwZmQ4VfqSKbwjxeNfGpzaD9Z7Ep4+B/QANfjSaLrSfY2X/RJWaeYVo6jpfs6pdUTm
	P3k9kb7rf6gkAtcTW3gpOqSITpnb4IVJDnRxwrEx2wnwnmunbKqkgoVvu9zMH9fSe4Ck7JN+4f+
	vLICiCrpWumxdunihv8HZDfAlCGtkJHZbl+vU4+qbKa42s8x8g8wySpYgZk7bGceNKypcqcbd1Q
	Vzkb0dFfzhxrKeUyng053/EaGown8j+0
X-Google-Smtp-Source: AGHT+IF080FMZ6CpD0SRUEt5pubAQzNpdqNUDMW9SpfKX8IdMHFAprYpSd8ust3GlHMeAuMZhSBCcA==
X-Received: by 2002:ad4:5ba7:0:b0:6e8:98a1:3694 with SMTP id 6a1803df08f44-6f2c44eb12fmr92656206d6.8.1745032544515;
        Fri, 18 Apr 2025 20:15:44 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfcd40sm17230636d6.72.2025.04.18.20.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 20:15:44 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm-bsp/external-system: correct whitespace warning
Date: Fri, 18 Apr 2025 23:15:34 -0400
Message-Id: <174503253592.2569909.11899784875392129727.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250418131002.95131-1-jon.mason@arm.com>
References: <20250418131002.95131-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 19 Apr 2025 03:15:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6477


On Fri, 18 Apr 2025 09:10:00 -0400, Jon Mason wrote:
> Seeing the following warning:
> WARNING: /builds/jonmason00/meta-arm/work/build/../../meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb: /builds/jonmason00/meta-arm/work/build/../../meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb:6 has a lack of whitespace around the assignment: 'INHIBIT_DEFAULT_DEPS="1"'
> 
> Adding spaces addresses the issue.
> 
> 

Applied, thanks!

[1/3] arm-bsp/external-system: correct whitespace warning
      commit: ece994e08bac150e22011762ac1036d6efabe937
[2/3] arm/tclibc: add spaces after TCLIBC
      commit: 3124feab662b4a015402e92f0ed3315426e8666b
[3/3] CI: add spaces to TS_ENV
      commit: 62cb568a652fb13a4f46bbcdd0b2fb1e62475e45

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

