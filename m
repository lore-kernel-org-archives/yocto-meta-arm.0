Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5297EC5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 16:23:29 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.76546.1673281406150575258
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Jan 2023 08:23:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=d0X75BWb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.169, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-4c24993965eso113417087b3.12
        for <meta-arm@lists.yoctoproject.org>; Mon, 09 Jan 2023 08:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ed+VAuNNZ1HBpUy3jL8Ll9Ds7ACv6gScll0b8F93fQI=;
        b=d0X75BWbH4nuTcQc1iwgkjF+VN7MGFe7FNK9zsry6zDLi29KauMAPL0vdQ8DU64Q00
         l/c2AQsoKc8tfxJmjlHt4w5/in7LjBsokcbZ/nPMwp9mfkL++aHOoDOgbDDq19G3ey/x
         +t/XMJ/HDoRov6PAnceyFwH492jSZOkhTdoh52+10p6Rl7KfpGfWxpdKOcAQxTPuX7Js
         LlsoFzEiRNljItdq7hkCcU1Qnmu8Ipdq4iG48FBA2Un6rMtVErMHsx0PF0msq9203Apm
         dxJCC7puEiYGSkTj7yEunQw2318sIf6me7nwpSY1+gKe0Q80DdauXbkD26qzYfTX+yWg
         W5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ed+VAuNNZ1HBpUy3jL8Ll9Ds7ACv6gScll0b8F93fQI=;
        b=TBkICXVLHWrvHi16dSyz7z0JVIhf35m+fvH5/DvKMhbjfGCxlSY1/ZHLztF6OyqEmt
         Wnv1/heH7ufvmYbzGvGYCF64ejxHwuERTPq2eP6LeZyT1CY5wv6374fti9YMTwQIFFjQ
         Wu3fY0EBJRUJN1qcKFYi1Azfa2D6rrcdaOkb1jvCyLTKAZyeCvg6Jvr+3IY8aMqOK5jj
         +g3STRPL/fR6wzkNJxUUgOtcRLxr/Y0iN/YLJSl/s1jXdrZuEnsJlhogMklf8Xan3bdV
         IQ+6TbSksXIYfcU0SyAlV2HQakvF3Ut2IrKjf0dtisUYokmBpR8DqcVS2Np4c60f7uCF
         +QFA==
X-Gm-Message-State: AFqh2kqKjLkAui7oWesF0jFubsrZYwPc6vwp3MpSR1P4XL1khs3JZKnd
	4L0JMyPq+8ZGkRLQJVum/cB+9ipjePwgwy2X
X-Google-Smtp-Source: AMrXdXtgc6UpaqU3Dej4o39K5ML9LIBzlg7gJJl9JZIJFDwJfrs5NMiD+SxsDZdRa8VyjCgDQdScmQ==
X-Received: by 2002:a0d:d742:0:b0:3ea:6640:5f43 with SMTP id z63-20020a0dd742000000b003ea66405f43mr14518648ywd.3.1673281404992;
        Mon, 09 Jan 2023 08:23:24 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id s10-20020a05620a29ca00b006fcb77f3bd6sm5603567qkp.98.2023.01.09.08.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 08:23:24 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"adam.johnston@arm.com" <adam.johnston@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm/trusted-services: Fix 'no such file' when building libts
Date: Mon,  9 Jan 2023 11:23:05 -0500
Message-Id: <167328138753.3677955.15923633763338487717.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221216175508.3149543-1-adam.johnston@arm.com>
References: <20221216175508.3149543-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Jan 2023 16:23:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4241

On Fri, 16 Dec 2022 17:55:07 +0000, adam.johnston@arm.com wrote:
> The libts recipe assumes generated cmake file will be suffixed with
> '-noconfig'. This is only true when building with the default type
> i.e. "".
> 
> Check which target cmake file has been generated before trying to
> patch it. This fixes 'no such file' error when building with an
> explicit type (Debug, Release, etc).
> 
> [...]

Applied, thanks!

[1/1] arm/trusted-services: Fix 'no such file' when building libts
      commit: 74f0ce702870b95cff0686873c7f5eed6bcd015c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

