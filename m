Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C530FC4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 02:18:15 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.10658.1713233893769927017
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 19:18:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Ihk7pZOS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-78edc3ad5fdso181207885a.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 15 Apr 2024 19:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713233892; x=1713838692; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DO++9qO/uS6XxNBTskk8nrOvWck8JXHPI2oHTdYcirY=;
        b=Ihk7pZOSaoOn7ec2cLJY54z5DTQ28wAWmq3XzulHdN6h5AUzsJipq+sFZtPQ5klwmV
         n/cq0VcEzjKcsr9VQMr3tLoKFe1hu+AHOcbSzifUcbryWuaS3HHVFAGktjCvX5fAsxlS
         aLJraxCIkAJ5Kb8gbvO0Z7ycYdrN2XdS+HqLz+Soybw0b1SllC2jgZ/Ma/E3CV8lOM5N
         HRIvbl+rilMw13kQlEh0RyqkP2XNL6OfEHQ7jhpwCmYmoyvzH11T3bhpevMGgmJNgeXW
         LYwbj8VXspkif1SKLMroE1z6xKRlrCFJsFJCVBK1Sa/4Cid8g0zA5Peav0ORuqwG0IEW
         qC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713233892; x=1713838692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DO++9qO/uS6XxNBTskk8nrOvWck8JXHPI2oHTdYcirY=;
        b=hXhW31TiUL8TBd48sdKxBHQQPGt0AMdUhMaynTR14LL2UieSl/7QvDovD0SeNtypsS
         8uDq20fPEoUJGaKrW6jXNxS877X6rW6qgJWoNwFkB45nT6VcbRVvjOTv7KoEBtQ7JwC7
         +UiTQ0o0yhrGIOTCW1dU5398PdbbHAIbOUn0ZqGYfB85TL08DXdx3zdy9W3SzFciM72U
         Bdi9R7rxizISO7EDzaDjd3NlsIU4hq1VIOOoKrBhQSWVDNkTkXTQHbaUinmOIM+q85KW
         F3lVd00boANrpb5OyHf34lMpJOEDdvpqBzFCfx8nxvTpaWfYe0EJI9DV9OBz+IFmRJXM
         fxPw==
X-Gm-Message-State: AOJu0YwGye5xdFzdDmW1E0Lh0O+O0Ea1Ps1OIK6ifIZrtmTXRd0p5YY2
	bAdZLHzICDRhVYH4IXpTdqws365ANumgc+k3LGB+YH0hsqlJuxqtsAl6IF31tjxMjUoq5HscHSk
	=
X-Google-Smtp-Source: AGHT+IGJGz8ZHl5xRwhtRQVf8KBg5vlOssuJ/Aynts1sR4hVKCM103dMLEFWqeflmJlii0ufFZhaQw==
X-Received: by 2002:a05:620a:450f:b0:78b:ea82:5eb4 with SMTP id t15-20020a05620a450f00b0078bea825eb4mr2394560qkp.25.1713233892601;
        Mon, 15 Apr 2024 19:18:12 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id da2-20020a05620a360200b0078d74f1d3c8sm7099792qkb.110.2024.04.15.19.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 19:18:12 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	bence.balogh@arm.com
Subject: Re: [PATCH 0/1] Disable multiconfig for CS1000 firmware build
Date: Mon, 15 Apr 2024 22:17:55 -0400
Message-Id: <171323387901.3101369.15763273046954962391.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240415092627.341741-1-bence.balogh@arm.com>
References: <20240415092627.341741-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Apr 2024 02:18:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5544


On Mon, 15 Apr 2024 11:26:26 +0200, bence.balogh@arm.com wrote:
> From: Bence Balogh <bence.balogh@arm.com>
> 
> 
> Bence Balogh (1):
>   kas: corstone1000: disable multiconfig for firmware builds
> 
>  kas/corstone1000-firmware-only.yml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> [...]

Applied, thanks!

[1/1] kas: corstone1000: disable multiconfig for firmware builds
      commit: b6843e30d349d004f624d9d20cbad069f07745e1

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

