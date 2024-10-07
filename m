Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58049CF887D
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 21:03:09 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.3127.1728334985718447295
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Oct 2024 14:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=qJsw+kSU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-45cac3368f0so28482901cf.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 07 Oct 2024 14:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1728334984; x=1728939784; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtgLUusbCcNwbjvlbPT0xnth2ShLyizEfHrTasbb4pk=;
        b=qJsw+kSUVc5jCKbUhz6mFccv8jdPwF8EajvUtm3CwKZlOIn9HagSHxQ26r8P0hDH32
         mgwkh4sFb63izmPblLpbT1uKwmhrzn5mIaOdtB2Lax3LC6XqWJWDrnXPKv1CaN9dISH5
         XKz2zD3nj/ZhyqUIXm1V9cR6KA15RhxZ4dTOIbmxOgk09mE8qvbBJvxrksRMmQUouvG/
         4FUEXPO+chMrk8Un6/RnVDZa7d1fojeaXw9UGXTMEZxc9MnE4XaSsEOEdGoPtDq0kUzI
         f8wZt3TT9IoK6fX5EzdjhO4T/z7UMlEDrvvrMMxWBIJjc9dxeo9jN75JCo0O1AclirkH
         fhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728334984; x=1728939784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtgLUusbCcNwbjvlbPT0xnth2ShLyizEfHrTasbb4pk=;
        b=sQEUPGaIScXAMPnTllUZW1nFznI9Lgy/dXSXWADqLwM38+rTYLyFZGbX+LIOpZRi7f
         J9k6cOh31JKXfqi1pcH34B1IeMoCj/tVd20EtMaRDodP8+vEdYzM3E/Vu7S6cSQHVOZq
         ppRep94qqZzyaZLDxm3iAOitsCLOKjsUO1VjNAWoKzT9XLwdP4MBRyoZ9k8p/eYU8x5G
         UOXJ8fZnt1v99X8GSFelyr+HNys1SxqbGGTI0B+LvSXUiGc31OAxaqa3PXXzn58kMUbP
         gpkxsW5rcs1D4JR2p4p0s3KaZtPvec2Iurs5nBpqRLP5vjhEY5VIr8TQZPa6j0ukjzOw
         vulA==
X-Gm-Message-State: AOJu0YxK2lAH6R04PlIm60AYIvSyqf2/XxbB8OQnj7zHxBb2hpZIRt1f
	3oJW/+J2Vra0VuSZon80gqoEcKzs4og8TXME6q5mEICCWXrdDAY3YUTCiD1zzfUP1N7imLKVEto
	=
X-Google-Smtp-Source: AGHT+IFMBH6qVNcnJXHIj4j9nHQjNU0591Y/g+7Etl88QAAU1ORZe44kxJJ8TfBUOSHnZpr8GOvahA==
X-Received: by 2002:a05:6214:4b0f:b0:6cb:3c08:31bf with SMTP id 6a1803df08f44-6cb9a440c49mr227595456d6.12.1728334984416;
        Mon, 07 Oct 2024 14:03:04 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cba475f1bbsm29100036d6.115.2024.10.07.14.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 14:03:04 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: Rework qemuarm64-secureboot matrix
Date: Mon,  7 Oct 2024 17:02:51 -0400
Message-Id: <172833497108.3506178.12062269682473377611.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241007141109.11362-1-jon.mason@arm.com>
References: <20241007141109.11362-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Oct 2024 21:03:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6178


On Mon, 07 Oct 2024 10:11:09 -0400, Jon Mason wrote:
> qemuarm64-secureboot is using systemd for uefi-secureboot, which has
> warnings with musl (and fails to compile with clang and musl).  So,
> modify the matrix to keep the coverage of everything else but musl.
> 
> 

Applied, thanks!

[1/1] CI: Rework qemuarm64-secureboot matrix
      commit: ca9375b72d6aa8fe7dacfce7f5187da80815fd01

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

