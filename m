Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.16885.1594722101787403156
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2020 03:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=ei7fYX3S;
 spf=pass (domain: burtonini.com, ip: 209.85.208.193, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f193.google.com with SMTP id e8so21800547ljb.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2020 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CMPqyp0c+ur6+P2fwVpr6HF12R46wzVEck/uEHsr+E4=;
        b=ei7fYX3SLr6y5zfJf94H1EkfbmfSBj6yDTY17JqcvvFPWEEBVGh7GXBxHJa8UdOzBT
         YFb+EdOg33C5tab5qzDokBrxIDo20olBQJ/pZlEp/bqCdOcsZrkbPETci8vftQVn+NoU
         shVBLazfXSZgFRy+2pZh2dT/MztIfwO17c4qOKHRK9M194lUIfoCvfOwYepq4fbEJ9rA
         cEvrXCGWw1IuYrMtxjnuwtd5N/p4cKNdjxoYBWRQvy4usRJ9bjeiqSGc6O66ht+Kf2zz
         pPJbwttl7vrZ4OOn9S1Ex7UkPE+sU8uY0oWOYmGFjFCICh+I4NvyxC4Ypg18Fa3ii2OU
         +lNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CMPqyp0c+ur6+P2fwVpr6HF12R46wzVEck/uEHsr+E4=;
        b=Rv5qrKoL45u0BB8cf5ACCAEC0SiQs1SU9e/k60gnalcNLv2bVQAEynzk0xPiXEPPJu
         fEX0dND/3fwggLXT1zzp94uVlsEkCjQvXepeRU9dwYa7zo7hhFjlJIgd660m+ByTZ+jM
         OmnmpkIeJYHVcG18v6noBXqQGxrUk0NBXCWL/0xDsLws1l4JPXxkBlYfaq61YsnfJkAi
         KOQnuRiAf/ufPkATi0dvvsxx5fhtUMqpNj/YbqWzt4bkHU4TTdfJn2f/3EEaEqWEonO8
         ko7TKKz5/0FLsADhJYbl8TDQ04Pl1km7ALdi28j1/Ym5/JnmFE5dfL9r6tT9L60Xxi6X
         8xHg==
X-Gm-Message-State: AOAM531uM9vfCKCX7DiHpED9Hq7xmu2ObjJkWKgkrXYWE95UnXyVWYse
	bwNvTzLktLiq7OsH5QyYGm12NbyoLy6UMJUZB3vPqA==
X-Google-Smtp-Source: ABdhPJwITJOULOUpB1A8B74ySxk63Iyp/raJ92oIeJ+7QvrSYds+VkZg5b6ItHRhM80l7ZQ+kdDx9rzWtUhTBXEtHTU=
X-Received: by 2002:a2e:9908:: with SMTP id v8mr1911558lji.186.1594722099680;
 Tue, 14 Jul 2020 03:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200703145233.2494070-1-raj.khem@gmail.com> <CAAnfSTsByeHUS9daP_L7M9qF8AhMdPVP9i+ri9b1ZzV8VCkfGw@mail.gmail.com>
 <78278e53-6dd3-b238-2c9a-6ac3c0757095@gmail.com>
In-Reply-To: <78278e53-6dd3-b238-2c9a-6ac3c0757095@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 14 Jul 2020 11:21:29 +0100
Message-ID: <CAAnfSTssUiPGZ-uABktZ0xwno8UqZh97KASmODMJJuJwmsJsTA@mail.gmail.com>
Subject: Re: [meta-arm][PATCH] meta-arm: Use dynamic layer magic to build trusted-firmware-m
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Jul 2020 at 18:09, Khem Raj <raj.khem@gmail.com> wrote:
> So I have added meta-arm-toolchain to distro ( ever to reluctantly ) and
> it did not break anything so I intend to keep that change, therefore
> this patch is no longer required for my usecase and can be ignored.

Thanks for the update Khem.  I have removing the need for binary
toolchains on my todo list.

Ross
