Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE48C54EBC
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 18:27:44 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.1141.1673375261200170952
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Jan 2023 10:27:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=fEp3WT+q;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id h16so268773qtu.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 10 Jan 2023 10:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ed+VAuNNZ1HBpUy3jL8Ll9Ds7ACv6gScll0b8F93fQI=;
        b=fEp3WT+qzvvkoU2Mu/KDskTqorrXKyeMGnyTJDRkV3DnT7P05ixsKqwrXYLwtZURF+
         v1JHovwVE6bbkPYntziwPy3LFwv91a5Y8BzhgzM21q2gpm8C+j+ERDWW1TdFGu97Q479
         x+/NysY9Y5/8gGllWrFAPMufcl7xMTMNYRofiV16VALSMLmjAdfj+FhUbAHeazWdugJ+
         G1HfIAAECJ98pWlK7lSeVv37BhGYw3KkrWd29Gp865aOJHsWhd5t5VJl7mvVyjXKxyjl
         mD1+DFQA6QBGzd+5hfiBOw5rHiZ5FTzCzbb/pmVZ033ZUH1j2JJHrlvLdidtMPwgLhyE
         calg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ed+VAuNNZ1HBpUy3jL8Ll9Ds7ACv6gScll0b8F93fQI=;
        b=C7VCl2UkqUbUAPn8ww7qH63oe/DN1kdpu8qbSMOBNmoovUwx5TexuN0L+ZmrzWAAxM
         +KMpc6kaOKW29ksZ+m8bB4hlqycXDHFgQK9X/0jiHGHpkXEFmgqDw+2Tf6Yh/J9kA3o/
         d9uMgzgCJpx7Wqw0zB7sBGCFNLTFh5zicJGSKJjshi8AT1mlHzdzfxFSes/aiIUM9Ksp
         22QBQGsl39h5x4FT6oyrxNI9rPILYYNt33T8ICFq3u8zNwEZwprzQJMOKJGOpyHMSLge
         lGhTSsWDU9ofiDZSBDKgq6uhT2tyhL2jUZGmYqmfRB56wbinlbDFPtqlJu/Knz7unq+e
         R0Sg==
X-Gm-Message-State: AFqh2krst8KiqATtuCz7yrGc9Sxepq5MdZ9y1XAzMKVPUwscHViMsP/r
	F8hOejFJr7jtVvoZLX00SsCgolFexWkhtiuH
X-Google-Smtp-Source: AMrXdXuYiEHsPIsDR1lIqMTrQC01I3lObSHvPsOMde33gLUjw+b9vA0bnU4s9nLd91udWa4H0EW9eg==
X-Received: by 2002:ac8:70c:0:b0:3a9:7d16:ef64 with SMTP id g12-20020ac8070c000000b003a97d16ef64mr93529850qth.57.1673375259771;
        Tue, 10 Jan 2023 10:27:39 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id hg20-20020a05622a611400b003a81eef14efsm6325756qtb.45.2023.01.10.10.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 10:27:39 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"adam.johnston@arm.com" <adam.johnston@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm/trusted-services: Fix 'no such file' when building libts
Date: Tue, 10 Jan 2023 13:27:22 -0500
Message-Id: <167337524536.2415313.4208708748092567801.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221216175508.3149543-1-adam.johnston@arm.com>
References: <20221216175508.3149543-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Jan 2023 18:27:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4255

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

