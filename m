Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E591C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 12:57:40 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.72356.1718974655095846667
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Jun 2024 05:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=0rvdVyt5;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.180, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-632bcf111ffso19573527b3.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 21 Jun 2024 05:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1718974654; x=1719579454; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5jHeYYWcA7KS8HTe8PRVLC7sGXL0EjDsx8+NtpuczM=;
        b=0rvdVyt5CIza3s6kvr8LpAh96U+22Soptfd6mEpt/6QgSotK7YnXNJZf93Oa3tKo/S
         O4WWywewY0Xy/RPqnfJumhL9UZ7I6thLgSyvaG21xx05+7nGoTpCty4iV5kXLd5UVEQv
         lb1iLP/Lpz6Qm72JpFu+rwRT9dK20pH7fCc/RNyJiDhGG+nKNZX1WnWVR6dyybekjCTT
         duuq6+p75REAjyhivccCpyxh/motNljNj5ZT3QyHoBlbjua++PYRxUvmZa73KRboDk4w
         k17aqUdRUF8WwqgVAb7GZ+MV5Juf3u1BC7299JrnsKH1uwsoMan+zvG19uJqnP4HbcLl
         tXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718974654; x=1719579454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5jHeYYWcA7KS8HTe8PRVLC7sGXL0EjDsx8+NtpuczM=;
        b=kGQBd1fSN9+zpiUsOrj+jwNsfXNX5ymDLEWC3KEND3j0zHpAJIVEIqdzFPnZFxvnMg
         rDjDGFcH5uN+4/j+nPlfyuoh5178GKjii6+QPig29F9pp7zrCHzhDHgT3xJHKn2rlLWJ
         /yMd+bSA++xN4/a/YCVC2dsfd0y+lxWn84bq8g2clniUSj+V8PBYUYi0bewSfLirS3h0
         +ZxBbw1tc6Z5JCaNOISHw8VsvG48jhWabbfCKcsjb8K/XCmtr33N39uWCcGaq9Jg1/aT
         xBfEIn/4GMFftW+8Zh6MByMR4G8ZrPywX33bQKQHSfSuJ3wdjk1AUk3BIwzB9XQbPhaW
         6Qog==
X-Gm-Message-State: AOJu0YymC1FCyppku28vHFYII5ZXYXk8JqHmVtBIcCC0v5WY/uBdbZVI
	Jiqg87DBMEwzLsGKjkMwl4CteyB8/5Rz+g7vb46aiIGXF3a8DJj2RBIUTqqlvdpeXzj5mU7t7Ao
	=
X-Google-Smtp-Source: AGHT+IFd9byXVpjCT+fxAPjSVAdJ5NHz5EMxF3C+ynEQ+P8bwDoetQdMrr+ppUSfiWh/TMvY1ryAFQ==
X-Received: by 2002:a0d:eb41:0:b0:61a:cd65:3010 with SMTP id 00721157ae682-63a8e1dcaedmr82478707b3.30.1718974654035;
        Fri, 21 Jun 2024 05:57:34 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f15f63cdbsm3242007b3.133.2024.06.21.05.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 05:57:33 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/qemuarm64-secureboot: fix qemu parameter
Date: Fri, 21 Jun 2024 08:57:26 -0400
Message-Id: <171897464586.4086829.6986156239506346153.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240620125541.70574-1-jon.mason@arm.com>
References: <20240620125541.70574-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Jun 2024 12:57:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5841


On Thu, 20 Jun 2024 08:55:41 -0400, Jon Mason wrote:
> QEMU has deprecated the no-acpi parameter, in favor of "acpi=off" machine
> setting.  Modify the machine conf to use the new method.
> 
> 

Applied, thanks!

[1/1] arm/qemuarm64-secureboot: fix qemu parameter
      commit: 8024166d6cbbff996c1ab6f1b30f28a01ae5fe8f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

