Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C8FC636D3
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:30:03 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.429.1676237378774179531
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 12 Feb 2023 13:30:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=rx2/J5Qm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id g18so11981543qtb.6
        for <meta-arm@lists.yoctoproject.org>; Sun, 12 Feb 2023 13:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DO0G3x0BRUwvRbwU7E9iDcnKADGk/7F2cZYe1c2ioe0=;
        b=rx2/J5QmfXDUdnmmHbEIpsf3lCj96tLeC4o0ZrHwvdTAeI8g96caQVo+ob6eVsHCLm
         mIZOSO+O2lRs6bYKjAFo6RUy0sRpDvRxC4dg6KJ6TkOVZvsfDziZfpCXUzQgKlPx7sD9
         xg/fNQ3KLndHw7jr4bi9A3ib+EAOkX9jCUFm30erB7hQYOtsiotnGxQcEP+smLMORmHO
         qO5AbI9w1GdVSjXYZEHx5nZfd8XyM6+IuHh+/KLOd7+9Vn8ixBrYS6t/uvDV9vNdcMA6
         U72By6YTCuyk4Q/IteKbI69y0Y3MYfnHUhsy2uptTZhq43NZ8SNVzM+6qmRCVM9zEyvN
         NDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DO0G3x0BRUwvRbwU7E9iDcnKADGk/7F2cZYe1c2ioe0=;
        b=iFr2BZbt+6wsr1s4s1iAy6HVE5xNQieQNgRk5kkC82hJt2mfPrD+b++LFJZVB1IhAv
         h1kAVDpimSDVsYY2xEF1KWche9ft5HLvBfBuosUlhO/qBlLe/GWZjG4R3w81bkMCncIh
         vCoMJ8GpSe/qo9Y7tzWlEhRQO92xtXa2f2uXBcTEGFUfI2l9EG63/Rx5Vo09vYtMlHjk
         e2/CsZaIMZVTeSGiBrTzk4oniujWDxVfY9LIBYYSPSKfiGLWfG0QYqEiEZIUljD+9gLH
         InE6TjOsboZzV2mQZs1IX6A35p01w9/dsR9GP/rQODZ8oDZ3vaoG16r7bRKEbElWVEDu
         Bk5A==
X-Gm-Message-State: AO0yUKW+liK8hlJRNq+ZMJnArXuXB9vReq6pMm1xatQQUK9kuniCBfnr
	/Jn9xJLJzzYE0HgvE1fb8EawQ0D8+4EI2zd7
X-Google-Smtp-Source: AK7set+P0mDh2AJMEaiEKBzYk5Gjz3lRAZ2XhZNplCLq12BAly642v2R4UQ5d4Z0doJXKEK6pHIm4Q==
X-Received: by 2002:a05:622a:10e:b0:3b8:6b23:4fc2 with SMTP id u14-20020a05622a010e00b003b86b234fc2mr36472760qtw.15.1676237400640;
        Sun, 12 Feb 2023 13:30:00 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id ce11-20020a05622a41cb00b003b9b4028d63sm7744375qtb.80.2023.02.12.13.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:29:59 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] arm-bsp/external-system: fix the gen_module race, again
Date: Sun, 12 Feb 2023 16:29:45 -0500
Message-Id: <167623738572.3515726.10526405596725046284.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208113853.1966445-1-ross.burton@arm.com>
References: <20230208113853.1966445-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 12 Feb 2023 21:30:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4387

On Wed, 8 Feb 2023 11:38:53 +0000, Ross Burton wrote:
> Apply the patch from scp-firmware to the third copy of the buggy
> Makefiles which fail randomly under parallel builds.

Applied, thanks!

[1/1] arm-bsp/external-system: fix the gen_module race, again
      commit: 0d7489a0552bd83a1cc9f2669dfa458a66924217

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

