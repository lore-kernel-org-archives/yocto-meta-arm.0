Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3B2C54E58
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 03:46:15 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.197.1710992772814842797
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Mar 2024 20:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=BlPI4yUl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-42e323a2e39so5446201cf.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 20 Mar 2024 20:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710992771; x=1711597571; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9yQhdTxBlXvBEcNiSvjx+GxHupcPL8ZGjYoOSs2yXU=;
        b=BlPI4yUlHNXsCpsrV33zCC7O0eHnZrRan1yeh1Vw8NbqF1KmPyXfAKuPAkL7AgkxsM
         OPYWFhUKgOso1BzjbwjfRu0t92314f94Uw2ibHfVdUrbBeKMVfSV0b7CCRtioawQtp6a
         uDBJwluk7UdxIdbZobg7ltggLhOKb9jqWrEYVK4ec8vf9C7JKUXCSqKfioPRcAsqtCSh
         8YuKdYGmuJrSVL6c68hNzpllXDMu5MoHeRMea1cGAsGCyftiIgg0J1hG+YySRcsHoi6y
         K5afeuyn0sD1c2JyQ7rFqwiJWwPAoZR8pRvL7I3+4QZydpO6H45EhvHPA3sv8RR3DqQl
         WLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710992771; x=1711597571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9yQhdTxBlXvBEcNiSvjx+GxHupcPL8ZGjYoOSs2yXU=;
        b=N705LLhPk1S2rj4qQiZUfTbxZTCbm/o7Kwult41CAm1lZ/pkTdENjwMzwBcCUdC7FR
         hMDziEXb1STVjSw00+hycQDu7TXCCug3pr2yKqLu0S3nm5T3JzDvausMiDn7SSF0GHJk
         qx4eARqAqBKVWGqVg3kQuRbhWOhC491gbTKOYrqRKELd2tkbDYkxetthVWxZQpP8TV65
         Sm30Vyq3z5H8flwScP5Gb/SWLWID4Hud6905N9gAS15JzLqePitLlM2KXtRrLoVIJ6si
         zihP/N5ZkCLraB46LtF7FoXehD6iMZIAxyK8iVb/D99CfAscsp1zbECbmTSKOxrm468C
         yWlw==
X-Gm-Message-State: AOJu0YzqN162xYDOWPw8vMYRxF7q19VFTp9gCLyUhAxOsRz9ZsZuUdNm
	z5zWuwsXcZssgL3Xo2Qz+9HNZmwisaD6tx/SwsmeG5FCfYBkF4n0xgFanCURy4QzRVDxqHFM9fU
	=
X-Google-Smtp-Source: AGHT+IEvqJyUsTgemDp6Ac54eWhreqR/1Emz20+z1gMGl/k0x0/tTiQY6t8WQYtFleDgjwr0PUQJ6w==
X-Received: by 2002:a05:622a:1923:b0:430:c6d3:b4e6 with SMTP id w35-20020a05622a192300b00430c6d3b4e6mr3010385qtc.12.1710992771590;
        Wed, 20 Mar 2024 20:46:11 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id ex9-20020a05622a518900b00430bcec5432sm5956436qtb.85.2024.03.20.20.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 20:46:11 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Subject: Re: [PATCH][kirkstone] arm/opencsd: upgrade to 1.2.1 to fix kernel build
Date: Wed, 20 Mar 2024 23:44:57 -0400
Message-Id: <171099269757.1316041.855141362901612328.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240320172720.2233794-1-ross.burton@arm.com>
References: <20240320172720.2233794-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 21 Mar 2024 03:46:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5467


On Wed, 20 Mar 2024 17:27:20 +0000, ross.burton@arm.com wrote:
> Linux 5.15.149 contains the following change[1]:
> 
>     perf cs-etm: Bump minimum OpenCSD version to ensure a bugfix is present
> 
>     Since commit d927ef5004ef ("perf cs-etm: Add exception level consistency
>     check"), the exception that was added to Perf will be triggered unless
>     the following bugfix from OpenCSD is present:
>     [...]
> 
> [...]

Applied, thanks!

[1/1] arm/opencsd: upgrade to 1.2.1 to fix kernel build
      commit: d7b7b6fb6c7c5545e718e44f38853d1718ce5446

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

