Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0117AC27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 15:45:52 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.30643.1719416747798993855
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Jun 2024 08:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=B4Jpl05b;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.179, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-64789495923so17104827b3.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 26 Jun 2024 08:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1719416747; x=1720021547; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EabjfYvEwyZyrHDflrrLbYj398ky9Z9ZUxCxFUOkxtA=;
        b=B4Jpl05boQrlqX3m3ChqmEdvJ0NL7nCFz03EF9pZi3jq/o5g3hwWYGe5JWqO8PPnKO
         AHgDLW2kZ/k4zNsPrEm1xur6dQliwbHegJObEaAbwzZWNVvToOYBBD10OsysZv5MXcAm
         zgTlFSoez77ipQWnOh1xWy6sVn2YmhscngzCxGQC27Q+5CjdWmvUgl+bQka4pvkqaRhv
         JF0haA5s0ClGFfuAXHZT9CrMqplHwSK0jybAAfR0y+scb3PaAf1NcpX8BiDMjjtIIPsB
         uHtvnkfy85mn93Ks02duNTBiaIm+uAzRfISsY+rqmnpTn08RHW/XRZqLtNbEfxowFC+O
         8oYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719416747; x=1720021547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EabjfYvEwyZyrHDflrrLbYj398ky9Z9ZUxCxFUOkxtA=;
        b=U+ypP8caaW0nJ6mibxT70xA65dT9oINWI/K+tB+l07lEIlOFTBLJMcSBZuE52x/zy/
         ECmRBGyEa9TKzuMIHsgc/noqB4+5PhO7fLmY8+kxAINV7QmLgPlRYRuTrx+I2+d89Uwp
         lzMirRe2bo1rn7DX62QL4fUK7zIZ3T2YNQf+K7LOl3WaXm731k5jwfOwA0jt4zWTSspo
         vABHIi3I36sqWxUs+D/pQA31H9UW0HJYyY5zDTM+Exf7INMCWGFR80pxznNvFH3HfsZZ
         Z1o9OxXa7hDcRgyqW8LF5+ohGuP8EfiwppKMHVDs5V96CmDN1A8Yyfa6o+w+hnc2KYFp
         ZUhQ==
X-Gm-Message-State: AOJu0Yx+8zTDnsQVrK50zRa9G96QV78gcc2RrVVlYMGZU3fZ68dnEuJs
	ddHGlk8TyUZopZuKB/F1pbHAjqxILPlEzAEuU8bGiJEpjb26JaplX0u3USneA+eYdCBrE66ctYc
	=
X-Google-Smtp-Source: AGHT+IHgDkTjOtkDQIbWxPlC7O7iNA7vpizUYNV0LFaGAmQjxcY6zNPU6eFO3HsBhCMPKjVDKKpESw==
X-Received: by 2002:a0d:eb8d:0:b0:643:4c39:8388 with SMTP id 00721157ae682-643ac0367b8mr101589287b3.45.1719416746521;
        Wed, 26 Jun 2024 08:45:46 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f14a3c847sm39682017b3.79.2024.06.26.08.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 08:45:46 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-toolchain: fix for WORKDIR changes
Date: Wed, 26 Jun 2024 11:45:42 -0400
Message-Id: <171941674201.3053381.13702943073052170188.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240624141557.34033-1-jon.mason@arm.com>
References: <20240624141557.34033-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Jun 2024 15:45:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5844


On Mon, 24 Jun 2024 10:15:57 -0400, Jon Mason wrote:
> Fallout from the upstream WORKDIR changes.  do_copy_locale expects
> SUPPORTED to be in WORKDIR, but recent changes have made it so that the
> source/unpack location is no  longer WORKDIR and cannot be pointed to
> be such.  So, do this copy manually here.
> 
> 

Applied, thanks!

[1/1] arm-toolchain: fix for WORKDIR changes
      commit: 751e4817c97539a625b6a0b015b47b42bf9fdcac

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

