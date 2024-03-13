Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAA9C54E67
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 13:38:21 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.17154.1710337093109540248
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 06:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=x4SvLVZC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-42ee23c64e3so28369591cf.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 06:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710337092; x=1710941892; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZv9OJfWE6lPP3sSpp+RIkvFSJpM+HeveAkfKit/mxQ=;
        b=x4SvLVZCpgf2KtFg8HOYdtvK8osOPU5w3g6H6fik9Z89XAa2hZO0RZ9ei+E5nKrpTF
         6+OZ3QGGWrHOwGKXuFAMRQBnJ5vIii9ocm6mCPpiv49ry1A8VdHUO49Qg+p+v4Cb7AD6
         ZGKIgVSs1wQsnSgMjpWVy+TMu8sCaqSVLreF+wdtI5XMeTwdH5EvBjLqblHeknWV7lPn
         3VB26WmLXzpPv2ZX5sVBr9AgTM+c1C2j4rMjoBnGEseQF3SXBa2ULvu88iVFcXvf+W5p
         hnnKyA7QeT39D33rYsVrlmsPJ4fZ3awDXEJS8rz2VVizjK9V0WXCjwPfM/zAeEncTS17
         DTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710337092; x=1710941892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZv9OJfWE6lPP3sSpp+RIkvFSJpM+HeveAkfKit/mxQ=;
        b=b+T3JczWQf8i/SOzCnxZ5iwuHlKOzF0OpDjrS951Rn2hG3v/1tIA4HUksTXzm43Cxu
         JywKY2X7bolIo50PPcs9BkBzYR5THQ36CeQuB6OBVI3UlLaoD1bXyQevHI/ZKAotJ+HH
         RbFqEzl+v5Ybv3Rflplwvpkbk+10Pb+qrt6dux2goeXZFfapjIvORxrNtkgXlkv+dAFP
         c6/KHku8iMfKkuu/jxKCR3rQsetIfjggFSbebpzGt9HTwcaWGGO2kwb6IXQ0WudpoMkv
         2chj9036HaU9C/Ex4YUX16B2g6ujJDf/l8cZ0raNkoLE4w9/5cHNis0yEoJndCcSA7RS
         0kqg==
X-Gm-Message-State: AOJu0YwMoK+6e30RmbNDYBj2+/inlUYjbGVh5TmHQqr3RSmXZSXAD8m5
	2GAUTMDNTyBE1UfDOdBuSHwJgkobADE5z0qDTR7Pf0XGFuFt21QSdCApu7YcOdVv2w/N+ukzc/r
	5Fw==
X-Google-Smtp-Source: AGHT+IHTAmH0Lvd5oc6a/S8GNpuN1lgF8mPv7KKzNR7Py4gu0zUSEfOEzx9gf01UgEdE2pfDsH9YLA==
X-Received: by 2002:a05:622a:345:b0:42e:fa89:1491 with SMTP id r5-20020a05622a034500b0042efa891491mr3837962qtw.23.1710337091978;
        Wed, 13 Mar 2024 06:38:11 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id w4-20020ac86b04000000b0043095be3d98sm314238qts.14.2024.03.13.06.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 06:38:11 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	drew.reed@arm.com
Cc: Drew Reed <Drew.Reed@arm.com>
Subject: Re: [PATCH 0/2] Kas file and documentation updates
Date: Wed, 13 Mar 2024 09:37:12 -0400
Message-Id: <171033703271.1772326.9089002471420651687.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240307111836.59383-1-drew.reed@arm.com>
References: <20240307111836.59383-1-drew.reed@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 13:38:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5428


On Thu, 07 Mar 2024 11:18:34 +0000, drew.reed@arm.com wrote:
> From: Drew Reed <Drew.Reed@arm.com>
> 
> Updates to the referance kas files for building Corstone-1000 and modification
> of the ci kas files to use them to avoid duplication information.
> User Guide updates for how to build and run the FVP builds.
> 
> Drew Reed (2):
>   kas: Corstone-1000 kas files updated
>   bsp: Corstone-1000 userguide updates
> 
> [...]

Applied, thanks!

[1/2] kas: Corstone-1000 kas files updated
      commit: 6e2a547482fb29eadf939d847fb6e7962f19740e
[2/2] bsp: Corstone-1000 userguide updates
      commit: 9ea97cf4f5c6a2c7e81157d838276fd418e3a8ff

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

