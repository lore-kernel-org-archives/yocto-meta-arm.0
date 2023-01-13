Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242DCC678D4
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 18:06:07 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.95590.1673633144077659536
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Jan 2023 10:06:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=6kBpVFPc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.174, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-4b6255ce5baso295196047b3.11
        for <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 10:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VthEHlZHr23DRmbr9MOlWVRr4kifLhZmHvZpURUh+Qc=;
        b=6kBpVFPcqhjzB+oAzOPFLYJnnbyOWsi9uRUqmvRNJDM0mciKy5LOvkK4zJffL1ZLIW
         7WVkPzlFScJDve2jF1GGnRDMjC8LM+mHnk0XJ+p7v3YeSU/E1Z8sK6RYGshYw6csm2TA
         kMumBnnzSn+nW0lm+4GsKjR0o4CUSRrQ0rb0/XC1mQVF9Wq8E3PsxFJyz10hjc8t2EOR
         AIazwA7lOWphWU9Oiu5ga0uI+3GX1sF9DULRvxEGpgEPAblJxfNxXlhmn61EcZn9kmiO
         lwCVOYQ+TCwKfB/2hUvx2CSbObOZ++5mFuSzCN9fjxcOrDmSpZRZ6/6CozQUlA22obSP
         XkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VthEHlZHr23DRmbr9MOlWVRr4kifLhZmHvZpURUh+Qc=;
        b=oH2JiN7dNCzD7CYS5OwlhVbUYDsTmMV8pNqwCWp0iAbVyddC+WU3ANAZZgp7FSDCK9
         sfKQ+U42413kNhHOZfEqrrUdW7CxjfzHBD3fQ8kvRyq6iyPXkrGqj7X4bMZveW2abkuR
         WrBYwrcsVnSdSvM5340qHgRpoL2iqz8MGi1UHl+VY0CuSTt+BXzty9QadL/8RMbcyEei
         N8V+Cx3teN9mKoXBSumQORKE+lUYfkbnnZBVNhwxVeBV6nHuiqJT+pVk2HONBqxK+mD9
         qnzhCLDnl3ULe4goD8nW88+9jjdY9mGMIKdQREkX9SI4NYKhpqewu8wJrZwFBbE53TXK
         Xvhg==
X-Gm-Message-State: AFqh2kpHyfKua8IS2LiWVxwly4IsMlwD1aDC5ufcsKGq0S0QOjs2XhGq
	3BCTvNJOJms3dhdUgdXsJsKA9hfg/hU1Y4XB
X-Google-Smtp-Source: AMrXdXtfJgtKt536b4FdUnYYWJJYRpkpzwDCpYfGwQCY/gl0M47ITbmnP47xGr6291wNOvePv7HQzg==
X-Received: by 2002:a0d:d649:0:b0:4c6:3b8e:3c34 with SMTP id y70-20020a0dd649000000b004c63b8e3c34mr23059444ywd.32.1673633163608;
        Fri, 13 Jan 2023 10:06:03 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id t11-20020a05620a034b00b006fa31bf2f3dsm12858333qkm.47.2023.01.13.10.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 10:06:03 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 01/10] meta-*: mark layers as compatible with mickledore only
Date: Fri, 13 Jan 2023 13:05:46 -0500
Message-Id: <167363314944.1009004.13142716921793993136.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230112110257.2070363-1-ross.burton@arm.com>
References: <20230112110257.2070363-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 18:06:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4285

On Thu, 12 Jan 2023 11:02:48 +0000, Ross Burton wrote:
> oe-core's master branch is diverging fron landgale and meta-arm will be
> following this, so drop compatibity with langdale in master so we're
> free to diverge too.

Applied, thanks!

[01/10] meta-*: mark layers as compatible with mickledore only
        commit: 146e9a5178ce6d1a6ae09a2649dc19364d4cca89
[02/10] arm: Add addpylib declaration
        commit: bba5bc91383fe8c72d88ccf6c1992d8106d7b4cf
[03/10] arm-toolchain: remove obsolete oe_import
        commit: d9db8b707541fe15baa3af7b94bff8777876776a
[04/10] CI: switch back to master
        commit: fdf95798bcc39174b4fafd995c1cd62ee21d6994
[05/10] CI: remove obsolete linux-yocto workarounds
        commit: 725281582aaf65f33c71274f7c86b75e646acacf
[06/10] Revert "CI: revert a meta-clang change which breaks pixman (thus, xserver)"
        commit: d3a0c441cde4a4dd3e3fd6d328c1244f7af076bf
[07/10] arm-bsp/fvp-base*: no need to remove rng-tools from openssh
        commit: 314b3b2eb73d3b91edef225a2cb5b15b9dc55162
[08/10] arm-bsp/fvp-baser-aemv8r64: Rebase u-boot patches onto v2022.10
        commit: a7d911310e0d4da4b2f6ca608bd9f528037da6dc
[09/10] arm-bsp/u-boot: corstone500: bump to 2022.10
        commit: 3f35573acbdc0a3aac9e81d794e14f849d40ee9e
[10/10] arm-bsp/u-boot: Corstone1000: bump to v2022.10
        commit: a51d4704ccd1737b8bc556bfe3e536142269bedc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

