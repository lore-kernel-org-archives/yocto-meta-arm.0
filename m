Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25FBC6379F
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 13:18:37 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.14617.1676467113946647419
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 05:18:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=tUkZceMp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id q10so12827525qvt.10
        for <meta-arm@lists.yoctoproject.org>; Wed, 15 Feb 2023 05:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fGhV8iGErsTjcetRlF0zVYVhOP4M1Arc5HnZgC6+01E=;
        b=tUkZceMp+rVvM4xn0dYiv1EHkK5AsrhtSH4sQMFG8kfw6uiCsztH/0SFEFOC135qCv
         ee7J6si8mEqAZSq67I+f+ZBeGt81lslcZ2YC42Ii7TtRzrlaRQPth9GMI4kYIUCyx9Dk
         3WXQCS/4DQq8OSCTekdMS7BKKv1K13ACHn/dt1cmcTRhZAJMvMSoDYQ4sgXw5gxXT7/U
         75M3lfr168sNN6WIYTy4wsrTo3MQ7ksvzPDSyNFnYn5+v71OCZkjLAJiO1feoWrp7aQV
         +36W6Wvq/kPWBEMcJfgOh6ixIJc7+dduqxyf0/5/Uykg+38gvSQ5yETcPfnDcYxVLcfA
         Firw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fGhV8iGErsTjcetRlF0zVYVhOP4M1Arc5HnZgC6+01E=;
        b=rhFUAYgmR8QrB23NXdfz3eoAIVzKsuWroaE9UhGVdWDMHS20Bi+AYCeJ2JULG5JPSG
         6zk5l2IE17x+iJTAxQXuhME56PJ6vVERTyvOS9wLvWU23bbxRHPUPZdT+LkClbqdo1QW
         uLw4fSFRWt7r6Y3880zmzGHuoBT7WjhWybDK024FZ+eAUDQ7v9rswuQ5keUqF2pbyxjf
         X9gMYbwH+qcAY6AyEjtI4nxoX6YW7eouzPLJWjBx9owHx2Jlcv4Cyo02pAYKJPRWIMYu
         CiuK2WVeS07AvKiLEfnVXa/ddLawfB5yTpBVlVk6hOp5OhnggWuleqfmQ5U/ecuFy5eU
         cvZQ==
X-Gm-Message-State: AO0yUKWACBPj8fINuuu6uxrBTRnuBcHt+SFTf04xGz3ZcqiWWLdQ+aSU
	3DVH1IkvuXP98Fbh4yModcl+dA==
X-Google-Smtp-Source: AK7set/9TpaWvHT9I8MkiHh4U+Vglex5tTeoEsN6eO9GxiFmasJHS66cUzm/BAOL8BRZ54QuFPf8fw==
X-Received: by 2002:a05:6214:20ad:b0:56e:9210:e34c with SMTP id 13-20020a05621420ad00b0056e9210e34cmr6003575qvd.23.1676467112923;
        Wed, 15 Feb 2023 05:18:32 -0800 (PST)
Received: from kudzu.us ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id o185-20020a375ac2000000b0073b575f3603sm3926679qkb.101.2023.02.15.05.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 05:18:32 -0800 (PST)
Date: Wed, 15 Feb 2023 08:18:30 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH] gn: Fix build with gcc13
Message-ID: <Y+zbprSCJyyyeYCW@kudzu.us>
References: <20230205175858.1485064-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230205175858.1485064-1-raj.khem@gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Feb 2023 13:18:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4395

On Sun, Feb 05, 2023 at 09:58:58AM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>


For tc1, I'm seeing the following error:

 | FAILED: src/gn/desc_builder.o
 | g++
 | ../git/src/gn/desc_builder.cc: In member function ‘base::Value {anonymous}::BaseDescBuilder::ToBaseValue(const Scope*)’:
 | ../git/src/gn/desc_builder.cc:179:12: error: use of deleted function ‘base::Value::Value(const base::Value&)’
 |   179 |     return res;
 |       |            ^~~
 | In file included from ../git/src/gn/commands.h:14,
 |                  from ../git/src/gn/desc_builder.cc:10:
 | ../git/src/base/values.h:367:3: note: declared here
 |   367 |   Value(const Value&) = delete;
 |       |   ^~~~~
 | ../git/src/gn/desc_builder.cc: In instantiation of ‘base::Value {anonymous}::BaseDescBuilder::ToBaseValue(const std::vector<T>&) [with T = Value]’:
 | ../git/src/gn/desc_builder.cc:193:44:   required from here
 | ../git/src/gn/desc_builder.cc:170:12: error: use of deleted function ‘base::Value::Value(const base::Value&)’
 |   170 |     return res;
 |       |            ^~~
 | In file included from ../git/src/gn/commands.h:14,
 |                  from ../git/src/gn/desc_builder.cc:10:
 | ../git/src/base/values.h:367:3: note: declared here
 |   367 |   Value(const Value&) = delete;
 |       |   ^~~~~

See
https://gitlab.com/jonmason00/meta-arm/-/jobs/3770086697


Thanks,
Jon


> ---
>  ...Remove-redundant-move-in-return-stat.patch | 43 +++++++++++++++++++
>  meta-arm/recipes-devtools/gn/gn_git.bb        |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta-arm/recipes-devtools/gn/gn/0001-desc_builder.cc-Remove-redundant-move-in-return-stat.patch
> 
> diff --git a/meta-arm/recipes-devtools/gn/gn/0001-desc_builder.cc-Remove-redundant-move-in-return-stat.patch b/meta-arm/recipes-devtools/gn/gn/0001-desc_builder.cc-Remove-redundant-move-in-return-stat.patch
> new file mode 100644
> index 00000000..f712037a
> --- /dev/null
> +++ b/meta-arm/recipes-devtools/gn/gn/0001-desc_builder.cc-Remove-redundant-move-in-return-stat.patch
> @@ -0,0 +1,43 @@
> +From 45673f4f62eb063d6d5aa0ad68a6171936ad9347 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 24 Jan 2023 00:13:57 -0800
> +Subject: [PATCH] desc_builder.cc: Remove redundant move in return statement
> +
> +Fixes build with gcc13
> +
> +../git/src/gn/desc_builder.cc: In member function 'base::Value {anonymous}::BaseDescBuilder::ToBaseValue(const Scope*)':
> +../git/src/gn/desc_builder.cc:179:21: error: redundant move in return statement [-Werror=redundant-move]
> +  179 |     return std::move(res);
> +      |            ~~~~~~~~~^~~~~
> +
> +Upstream-Status: Submitted [https://gn-review.googlesource.com/c/gn/+/15000]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/gn/desc_builder.cc | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/gn/desc_builder.cc b/src/gn/desc_builder.cc
> +index 444a5e02..3ef170c3 100644
> +--- a/src/gn/desc_builder.cc
> ++++ b/src/gn/desc_builder.cc
> +@@ -167,7 +167,7 @@ class BaseDescBuilder {
> +     base::ListValue res;
> +     for (const auto& v : vector)
> +       res.GetList().emplace_back(ToBaseValue(v));
> +-    return std::move(res);
> ++    return res;
> +   }
> + 
> +   base::Value ToBaseValue(const Scope* scope) {
> +@@ -176,7 +176,7 @@ class BaseDescBuilder {
> +     scope->GetCurrentScopeValues(&map);
> +     for (const auto& v : map)
> +       res.SetKey(v.first, ToBaseValue(v.second));
> +-    return std::move(res);
> ++    return res;
> +   }
> + 
> +   base::Value ToBaseValue(const Value& val) {
> +-- 
> +2.39.1
> +
> diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-devtools/gn/gn_git.bb
> index 521e33e9..2e58d28b 100644
> --- a/meta-arm/recipes-devtools/gn/gn_git.bb
> +++ b/meta-arm/recipes-devtools/gn/gn_git.bb
> @@ -5,6 +5,7 @@ LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
>  
>  SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
> +           file://0001-desc_builder.cc-Remove-redundant-move-in-return-stat.patch \
>             file://0001-Replace-lstat64-stat64-functions-on-linux.patch"
>  SRCREV = "bf4e17dc67b2a2007475415e3f9e1d1cf32f6e35"
>  PV = "0+git${SRCPV}"
> -- 
> 2.39.1
> 
> 

