Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1194C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 04:09:53 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.93.1698379785310598702
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 21:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=a9IASBwn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-66cfef11a25so10853226d6.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 26 Oct 2023 21:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1698379783; x=1698984583; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+RmyNUdxhoM2BopA6SfGwjR3sCIbihbKz6lAIDNkgc=;
        b=a9IASBwnn61RH0K0vxw4mhyLbzg6FOSygKG7vs8r5I/7BUTW6Hy7HpDxcHKeURVf2o
         D/SFM1KyBCP0PhfzVCskX+6B+SxeEu+Due+DW45np/LXEgMV6WS3TncR9YjA5Hj2Lnpf
         emuxBioXMAOtInxuTt8doIJxTCI+xoRx/gkNUyXAAoGN7S/LSNM+uOfO2ylAaPxZvm3a
         kxPxgl7ckN/ypioTfCrq+qihMGyBtqgA80u9W8ltFkWp5zMWjkWLcWAmbJ6jZqsuNQGl
         PaINtpWThjIXGM+ySu7kENt2Kk5mvsTGJTb0VjVqJPe1YgAGWQmHcyn+6nhqc8HhUIv4
         AjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698379783; x=1698984583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+RmyNUdxhoM2BopA6SfGwjR3sCIbihbKz6lAIDNkgc=;
        b=XgiYzW5PBERaSqjl1+e5OebyD8o4CnuzMLMGb5+v45cAjlv39Gqy0V+oAJN0PkZMND
         z+oUuSWpuZyjRt5UPvWKvSj9p8UGs7t9cdPOeH7DCOfhkYmHb5ZXbTZ8ZTFMVSlSx4oB
         0/COoFRZ67NUCXVyOa0wZXcBp9AbIdYIY7kR3P8XhfDyz1mJC22D7W9arIXa9lcYkGOm
         9810/2YiJUtK6SzaCTePl4GWRO0U7+NPEAEuh7k9mkxit1oCWAbi4h+drZMl8vi663sj
         ZuZwk6g4zSnh1aWpo1Hm+9uDuiWcfzZ8gVOfg7l289Fy+tb2xdxfAPFwORW14OWCS4u6
         aj2g==
X-Gm-Message-State: AOJu0YzFHUCwx8bryroEv7v32eXGj7kuJvhjLrKLNGex1tp/nFko8JJu
	4GzG3Z527U6+EubEyalW2JQSTR4LLTv1QoKlYOY=
X-Google-Smtp-Source: AGHT+IE/3HMpMGckeTVySY66IOxUwdjiu71oJlFtabpr1qJ/qsVPa2CSYjwLYe4xi0hGVgj3b9LeYQ==
X-Received: by 2002:a05:6214:d62:b0:66d:2eab:85ec with SMTP id 2-20020a0562140d6200b0066d2eab85ecmr1661427qvs.61.1698379783464;
        Thu, 26 Oct 2023 21:09:43 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id de10-20020ad4584a000000b0065b0771f2edsm306880qvb.136.2023.10.26.21.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 21:09:42 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com,
	emekcan.aras@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] arm-bsp/trusted-firmware-m
Date: Fri, 27 Oct 2023 00:09:21 -0400
Message-Id: <169837976565.3801272.4680214969868075542.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231026161947.2463621-1-emekcan.aras@arm.com>
References: <20231026161947.2463621-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Oct 2023 04:09:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5184


On Thu, 26 Oct 2023 17:19:45 +0100, emekcan.aras@arm.com wrote:
> From: Emekcan Aras <emekcan.aras@arm.com>
> 
> Fixes alignment issues for capsule update and updates the upstream status for
> out-of-tree patches for corstone1000.
> 
> Emekcan Aras (2):
>   arm-bsp/trusted-firmware-m: fix capsule update alignment
>   arm-bsp/trusted-firmware-m: update the upstream status of the
>     out-of-tree patches
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/trusted-firmware-m: fix capsule update alignment
      commit: 6dd462053817411cdf3626ea7d8edf8d31197699
[2/2] arm-bsp/trusted-firmware-m: update the upstream status of the out-of-tree patches
      commit: 450037ab33b22280557dddcdd882c3ada75ab898

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

