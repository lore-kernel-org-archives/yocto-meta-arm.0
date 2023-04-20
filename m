Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B08C77B72
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 17:04:31 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.1452.1682010266652926446
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Apr 2023 10:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=h8tO8VHp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-3ef3d90f773so4294891cf.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 10:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1682010265; x=1684602265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+CYIApaoyiMeSgkwDNlYkZD7xju4px7ukDsML1va6U=;
        b=h8tO8VHpe9+yUyfyr8I/Hz7pup/M1fT4zXBNtISLdiwPc4aR+zQ+EH7+xXIDBWbiMC
         3tO3JM7rc7XrmLw0aN6zFk6Xd/vRR2y1vN3LuHjocSUuq+qPM38ETe5PiygqD2m3eu4S
         YCgcYdT2Uh+V6Mr4vZM0X6fJy4dW7dffoqn3Stl1eo4AfLb+nhtwffqEwrEWw+WePmWB
         +tek8nhAFSHrfj9n7FJ7NBKD0QoLKeq7HDVf4WLQa9+CfEu6HKYLvEL0D7I1l1He2UEu
         MPHCnvzpVsKWSgBVM/yQwMWIqL5FDYPcQP6HMrrflDlJHv3I2B3HpwL8pMx1iPwavZ4j
         fnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682010265; x=1684602265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+CYIApaoyiMeSgkwDNlYkZD7xju4px7ukDsML1va6U=;
        b=TqPkpoTD4zMeaeGH+egpZ7NkbSsGVqyutZONb5aFduG93Koc52wUYDynBwWNXQae1z
         OHGBRuLjABZrSEJhQKRKHmkbx5P9x7Y9nGj7rdroZy578wQ70ffpOjtJWWQqA1be//m5
         iI1BApY9s/QO3iNN+rCAhewUxAhkpE6sDGY2F1wrb++JyVxLa/YBmQowdVnVKTjXUBCZ
         fxN+PVa7vyvQz6HJeVkIlddLPLCMtkvpuZTsC8r+YYG3yT9rVK3FU7DPwfIInv4nqIcF
         +e+wUxSd1ZCf7JFpbY9Cco4xYfJX1oQTKzeOZcT9lw8wQ/RkunflGl+oMOXQyljOFT0d
         UsTQ==
X-Gm-Message-State: AAQBX9ckxLtZqNPZHYx3uyrZCqvpH4Q/LnR9xD3oqznKNXwKs3qbeBd8
	jCIttZD75wFCZbXuK195j2bYn5WTxkufo2UUgAU=
X-Google-Smtp-Source: AKy350blHLQTm1wuhTPrAe9dXtIz7S6RbbfPuSYuS7afO6n7nb4IAip6sV3B+IkP7nBmK3g9YvufJQ==
X-Received: by 2002:ac8:5bd2:0:b0:3e4:e3f7:dd9f with SMTP id b18-20020ac85bd2000000b003e4e3f7dd9fmr3496136qtb.46.1682010265228;
        Thu, 20 Apr 2023 10:04:25 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id g7-20020ac84b67000000b003ef231cceeasm622873qts.23.2023.04.20.10.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 10:04:24 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/6] arm/trusted-firmware-m: add the tf-m-extras repository that some machines need
Date: Thu, 20 Apr 2023 11:40:06 -0400
Message-Id: <168200520626.413166.17173955725749503882.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230420125233.1918925-1-ross.burton@arm.com>
References: <20230420125233.1918925-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 17:04:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4601

On Thu, 20 Apr 2023 13:52:28 +0100, Ross Burton wrote:
> Some machines use components from tf-m-extras, so fetch that too.

Applied, thanks!

[1/6] arm/trusted-firmware-m: add the tf-m-extras repository that some machines need
      commit: a46ddc804e0cf5ab42014f66d278219dae71cac3
[2/6] arm/trusted-firmware-m: clean up environment flags
      commit: 387465c622b373e99cb0cccc7c426a5a18741eac
[3/6] arm/trusted-firmware-m: package .elf files in PN-dbg
      commit: 1596147a847ff76dd8848aa43ec5cef4b54b8aa3
[4/6] arm-bsp/trusted-firmware-m: enable for Total Compute on RSS
      commit: a091d49db1552f2ae4393369a1b4be81398986aa
[5/6] arm/trusted-firmware-m-scripts: relocate to tfm directory
      commit: 6405018cedf29114095cd20b2c35313a3fd9967b
[6/6] CI: add TF-M to TC build
      commit: ea407ce849f7f181f5b43a2495436a720a32cbef

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

