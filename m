Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44E2C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 18:58:55 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web09.30066.1639508335168343958
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 10:58:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=rpXrG+oJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id d21so10396527qkl.3
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 10:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qBSaTukrVX2acq++5oihvXvJKA6mSPnoqMEGosI4kVQ=;
        b=rpXrG+oJ/yq5wHqZw7jbrkUQEzjqTt6meAQzkeU9Te3ycCFxQWRF/goPpLJzc1QPlx
         UJovR5BlvK4n+DG7sJloKFbIYDMQfZFnHTwZpIF7++LsLO8sxcToZN/Xt+9jbgYDaGuE
         98Oxc2K8qjqYeyrctWoHz7oveiIguW3cJ3s5fzMAlDHaRq8yaB8CWe6hn1bw0rmcbswZ
         FQpr/k08H173ERc923IjnnIcgJTh/2uuhszVMsnD48RkaW324lVFtMJII2ELHmGQj6zc
         5geSWzEdr6duUazN2HarkWJ4Y2yGMURXdOXNMFCKBcvUhnTfpym8C2z+rovQ+VluDYNT
         1QZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qBSaTukrVX2acq++5oihvXvJKA6mSPnoqMEGosI4kVQ=;
        b=vx8MEg50LBn3E00FHehAZD8fDLFwp6GBLVm52wK6qAiZIhgIP/jZQ2HAHB8YxRhqeC
         5Ez+LJBT+VvYzDH0acu/QH+5ZR/Z9m03PgsFTtgo9qjCIfdnAKkkctKNzHiua/sXPvos
         nvZRsdJNZ9tVorYopBYlC/kuRnc6V07pifWcKJKkuRhdpCJFL5N5Ar8NOFjnAbtDjyVI
         oN0d1UXmFF/uom7N89d0VdSvPmhLdEF5v+DSpzVVdzehTWF8JPHJzi54F3J5fMgetoSy
         PeFONnLXfS0HgyioeJurlRk9XS0SjNnJEp3H6EklIW7eM2Zpb9Z4PEsCe7I2Zr4CWHCH
         loWQ==
X-Gm-Message-State: AOAM530Wyzrk98tc8R1A4F9wobmF1/yzePqfhGhDUOYXrA2nSpuOJett
	C6TibALlCZkWa3IBUHH/r8eOgvef7/52a8aYZSg=
X-Google-Smtp-Source: 
 ABdhPJy+KpLuIGriztngbwJlGXrrlNbUCi4/VTalALhAq2T91KRG5JV8K7jQ7E83JCcDXBNHAPZaFQ==
X-Received: by 2002:a05:620a:14bb:: with SMTP id
 x27mr5896473qkj.382.1639508334285;
        Tue, 14 Dec 2021 10:58:54 -0800 (PST)
Received: from localhost ([2605:a601:a628:a600:61d7:b140:9e46:6475])
        by smtp.gmail.com with ESMTPSA id
 m8sm388655qkh.120.2021.12.14.10.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 10:58:54 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Huifeng Zhang <Huifeng.Zhang@arm.com>
Cc: robbie.cao@arm.com,
	jaxson.han@arm.com,
	Diego.Sueiro@arm.com,
	wei.chen@arm.com,
	qi.feng@arm.com
Subject: Re: [PATCH] arm/fvpboot: change the execution order of
 do_write_fvpboot_conf
Date: Tue, 14 Dec 2021 13:58:48 -0500
Message-Id: <163950832849.29226.6220244183351137910.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211214081948.128217-1-Huifeng.Zhang@arm.com>
References: <20211214081948.128217-1-Huifeng.Zhang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 18:58:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2711

On Tue, 14 Dec 2021 16:19:48 +0800, Huifeng Zhang wrote:
> add the do_write_fvpboot_conf function into IMAGE_POSTPROCESS_COMMAND
> so that this function can be called after the build system created the
> final image output files.
> 
> It's possible that bitbake doesn't run start from the do_rootfs task but
> run start from do_image_<type> at the stage of image generation.
> 
> [...]

Applied, thanks!

[1/1] arm/fvpboot: change the execution order of do_write_fvpboot_conf
      commit: ebf413ea3c710d6987684bc3dbb0fa2ff4d38e19

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

