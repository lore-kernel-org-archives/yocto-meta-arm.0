Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5971EC113C
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 20:58:34 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5084.1771880307834982892
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 12:58:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=jdNXcktd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-895341058b1so60324136d6.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 23 Feb 2026 12:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1771880307; x=1772485107; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=StFp8ltjg6P0gV5ldDALSVOuZnUMt8wqns5Q4Yfg48c=;
        b=jdNXcktdI+k7mSg2HAd2Tg6USK9vUcBTZJGsxXgwfUan/vJ4bZ0jpvUeYbqS5pVCGJ
         FvSb9BetlUX8xXHX+QsnecphIbu3thmMvpYEUtdJpCL5/7JpjCBz2pxcgHYqpCgfBacv
         2u1ahUXW2CVQQvjTKs+0uw5UdOh7YnuA4Z8gafcd4XLLlh4qfhOYw6DRQcakqm0p8ddx
         XlNqwDZSCm/kWpJ3KZ1QH+IKVGRB16JXPa6zgzR82Ogcw1rwm9i9GoQX3aFoXe3SjuFv
         VetQ9j1eVw8g2RaLqEALM2BV+r29Dwo7wDxiM2Ya2LWC7TrI6kFL3kdz5fwVrAgjD6V3
         Kkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771880307; x=1772485107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=StFp8ltjg6P0gV5ldDALSVOuZnUMt8wqns5Q4Yfg48c=;
        b=or3/QkkF4yYkhyLT1+MQ/r2YNJn/pM6O/h1NbjT4k1HNRuXJ0VOdRFD3ntdCCfh80A
         RlqOlHaptIBapvpOoMybuyA0C/mcTtuAuvjBfwb9s0Mz6V57n/JbQqs0FHrGN45FJYZn
         0JV3FscWUU7AmPhGMOtCprpm2dqtRJeEoiFi+dt49e3z0MasfPN2ApLfltDN1xeX0w+z
         ax/D5IRLG3Zo+Tk+Vh7V/zdZxEitUX9TDf6XQuelXRRvt+fNE4hT4CzNiWRmGvzHTIBC
         GEorOXD3PVG2oNK0wwtHmCQhAI9nB95ziuj9yl+869Qcv/lmidH667/ieoJVHa6V8Rrt
         qrdA==
X-Gm-Message-State: AOJu0Yy0HfWkICSpMNNhwrDQ+4/Gl4IHIBAOEMVtG+6L2UCrihwnsSxl
	KypUJd4YFyZTtrqsonwVTt3l6WjHPm4KTlMMMH2Og7adE49Yc7ffHCHxOoxmYnMxqg4bWC7E+VF
	KSyY=
X-Gm-Gg: ATEYQzxRduwKu7mhGR2fUnpD9qAuI8v5rMgVgWtT7DJWiR2vyRnz4W4ldOmdNrvDcgL
	xW6gGzHNSKVy3HGRvkEdxhlrlwYGsHpm36WYFZHg0co6+C3c/SgzdtGxz8NXiXt885SFO/nRMy3
	PIuflOJ/4F9h9tz6ouMoq41+OI5Z18+qCCL0gKwBtxT6NFf2uKvqGh37LE21ZonePKsr709Mt9c
	cny+sYID/dLuGTavq1NHP/OQmUJHzSmg3caIBTGcjj4jcpSVJk1c3MSYATOGOWiwIckjRo/fpcP
	Eg4QV/iC9x2US2HY2r/P2SLlInammxQJWhx/LGR6szm/ibosiLKQBYVzccyCOZyyWepyiuiGF+R
	cpAKm/Ho+oLbfAGhHnSQNJqTG2kO+XyTlRJck+aYqiEVctN4SBo479yXvi6CpWAclQP2TPOZYnV
	kJpbfJXFIxwsPgZHMDXapORyf1QQ==
X-Received: by 2002:a05:6214:c6f:b0:880:1be2:82d4 with SMTP id 6a1803df08f44-89979c92ef9mr159777776d6.26.1771880306588;
        Mon, 23 Feb 2026 12:58:26 -0800 (PST)
Received: from localhost ([104.234.212.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997e24627csm78575856d6.29.2026.02.23.12.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 12:58:25 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm-bsp/sgi575: change target image for CI
Date: Mon, 23 Feb 2026 15:58:18 -0500
Message-Id: <177188029806.4005893.7102230736808187423.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260223135221.4381-1-jon.mason@arm.com>
References: <20260223135221.4381-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 Feb 2026 20:58:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6916


On Mon, 23 Feb 2026 08:52:19 -0500, Jon Mason wrote:
> For some reason, sgi575 won't boot to shell with
> core-image-full-cmdline, but it will with other images.  Since we're
> going to drop this machine soon (as it has been EOL'ed), modify the
> image type for CI to core-image-base (As that one appears to boot
> faster).
> 
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/sgi575: change target image for CI
      commit: 1e3d3f8b38bac40b5905effb7c93000d465dca27
[2/3] arm*/layer.conf: drop walnascar
      commit: 907645a0fcf179a0fbb3ef93695214026f5ce362
[3/3] CI/musca-b1: use LTS tf-m
      commit: 1aed815677ffde4df41265b80f42e79007498d5f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

