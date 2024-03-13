Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18247C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 13:40:12 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.17063.1710337210923134144
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 06:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=wwessCgm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-690bff9d4a6so32359846d6.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 06:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710337210; x=1710942010; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=udht+cLmSib/fY6osFBYsXomWYDnZvMYTelIYUcFlqs=;
        b=wwessCgmpAcOpbqHIgFf6higtSL4gsrr5E6NDxddTEuK0XfOwYdOgEbbiitl6LFXSk
         QYCYkCjVij2P8PyZV6xrz3iumIs9I23mLbjW7g0+kzttBtdUt6Yy0djuQzuVcKDkFdhm
         nd8rXW/YFmomDF4XETZkEnDvmEzRbH+9xvFHC1UA+2iHVyAt4/qFz73Tc2ADzqg6vUo7
         ihplTkV0q+0vGeHjVNvU6255KMdlJHhp/Wj+ldn/xEYLtxah+O4vg7PYByCbCey8pVXS
         Jm2qo0XAka5j3hIe/e++UW/NQNQ10D6YbhpNvAG0sjBnpobU3k2qTJME+ElJJlPge/XM
         bLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710337210; x=1710942010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udht+cLmSib/fY6osFBYsXomWYDnZvMYTelIYUcFlqs=;
        b=TtYfxbp/KAld2RKz40Iqj2H7be1kgDtyufqJFwBdPoLteWc2wNqo5H4Q0/SDM7H5Za
         oPs/BlnfsMUT/WpqA0N2JcWYJ+XxsM1dy49aY7lRjA8NqyRgvasG0nZ0KtuuppU5mEzW
         Ux6/M9E95AtwYpoq/sEXb8CPbtq8/9kz9emGoJWU81CaVbCr3rZEJzgrMvAUPNde32wQ
         FQ6+X8V8JTsLdyJt6CyKZOx0V6jMtPngiJRHms8S27EPD31tGXmksx+nvh+XS3GDbGdy
         3DZm4M4ysMIMdXYoletQDIrigc/orMLUY9uExeXE8sTcK1tMpdY+hzvYUWFDsRL3bCCP
         A4ow==
X-Gm-Message-State: AOJu0Yyp8NjSneWbzd+MXKNTMcr+dkEQaqTHY45EtMyp0wtOtP+ot/A8
	WgcvrRPiO7QhcAVStuSBll9dhVj455uzQAJ7soqTmbwZjmoziIT43DWy+Y+644ynVweX+WWAS28
	k4A==
X-Google-Smtp-Source: AGHT+IHLGQhCus2PLQ8dHXrM/cIu1S6hou0+Zaftj09/X7ANlZBu0LSRCB4rrBFk0OJDTPrM5wpRew==
X-Received: by 2002:a05:6214:7f0:b0:690:b99a:22b2 with SMTP id bp16-20020a05621407f000b00690b99a22b2mr10940814qvb.44.1710337209711;
        Wed, 13 Mar 2024 06:40:09 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id bt12-20020ad455cc000000b00690b20e5e35sm4740791qvb.87.2024.03.13.06.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 06:40:09 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [nanbield PATCH] arm/linux-yocto: backport patch to fix 6.5.13 networking issues
Date: Wed, 13 Mar 2024 09:38:58 -0400
Message-Id: <171033713777.1923891.15509769531713552806.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240312164024.64734-1-jon.mason@arm.com>
References: <20240312164024.64734-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 13:40:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5430


On Tue, 12 Mar 2024 12:40:24 -0400, Jon Mason wrote:
> Linux kernel commit 9aea191c29e18f7c044a2f95a2da7f7b7fdd0449 (backported
> to 6.5.13 as part of the stable process) introduces an bug, which is
> preventing networking from functioning (and logging lots of errors in
> dmesg).  Linux kernel commit 45b3fae4675dc1d4ee2d7aefa19d85ee4f891377
> resolves the issue.
> 
> It is need for everything, but only applying for aarch64 to keep the
> CI tooling happy.
> 
> [...]

Applied, thanks!

[1/1] arm/linux-yocto: backport patch to fix 6.5.13 networking issues
      commit: 150169d01f2f57dcd65854a2a43aebef87ee8d98

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

