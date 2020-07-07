Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.20372.1594140451212090373
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 09:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IwIAbnyD;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id b4so38709949qkn.11
        for <meta-arm@lists.yoctoproject.org>; Tue, 07 Jul 2020 09:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uR1oOx7K8yU3LvP/MTkWeI+7Wu3Eop7UtN+qQYaaVzk=;
        b=IwIAbnyD1w0UUJ/GVDgJAHSwfMaHgPaMhqkpq8vA05q2gjd1FRD7yX4CfmlOmI8/DE
         8o+N/9LKH1rshxd6veIFWxcG2qUJY+eH+dIX2Id6pfEN74B0p40qOiKsyh56rAXnqejG
         Rt/Wz7gYrkZbwcEkPo2R8P3jLl/HXGjhXF4QCHSGbOI3dtKC8kMSt4Ddhusf+Ulqjfs2
         0XKY4ev5GjzPipcUzNxl9PFeSLFioW9SNmXdSNQ5/fJvJDXvW1GGy8ggpOSJsAR6WtLO
         kx3J7T9HCwpV7c5C9jAPgZSkjibXv3UJ7aA2ukoNEAUvasDKr9jBpfyrSE2moIOh3pyc
         tAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uR1oOx7K8yU3LvP/MTkWeI+7Wu3Eop7UtN+qQYaaVzk=;
        b=jexwZTunKZyK58MjjbHneeV8ALytQk/x/WrkxiIcOBEef6g70WRGJA4/DNgVR/HuIN
         2DoyWVnxyJnx7y7M4xWkQZMFaiZU7GTir0wZXlP9vfHNkqgWG5ZoekzMS3aARtX1EF3W
         PiOLaxylwEm+8AL/yIi8NSdNy6ISdCcYAs8Lmwv2Za7/WtHspTDfiwZpO6dsNPXIVZXV
         ekJ4feM/l9TjgDA3/MmdwPfcffV6bTFVhqXsZl3BkPokdtMyKzKr0mQTTfqUblrGx8O+
         lhK0+vJn7ZGdVc/EQJlg4XMEnmsJT6AvLvKweAHmx4NaCV27O6AtfNi5173T7FhvXmUm
         wVlQ==
X-Gm-Message-State: AOAM532AGW+1uVW9ApL8v7FVOJ7XX5EP2+XTscM9Y/rfkSDqgXrFEkP1
	p59DHcOfkEgOBWrJnmk4xutF5n6jUDY=
X-Google-Smtp-Source: ABdhPJw7M5/7N7K1eZllC2qEKtrJkTptxNsMvOPsCe71EDXIlErr0hwwx+/9TagXC+yVHebpVdiAEg==
X-Received: by 2002:a05:620a:79a:: with SMTP id 26mr46886086qka.169.1594140449901;
        Tue, 07 Jul 2020 09:47:29 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:61e6:5be1:19c9:154e? ([2601:646:9200:4e0:61e6:5be1:19c9:154e])
        by smtp.gmail.com with ESMTPSA id k18sm22932867qki.30.2020.07.07.09.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2020 09:47:29 -0700 (PDT)
Subject: Re: [meta-arm][PATCH] meta-arm: Use dynamic layer magic to build trusted-firmware-m
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
References: <20200703145233.2494070-1-raj.khem@gmail.com>
 <CAAnfSTsByeHUS9daP_L7M9qF8AhMdPVP9i+ri9b1ZzV8VCkfGw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <475ba942-5c19-c36e-9882-b193f0f4ee20@gmail.com>
Date: Tue, 7 Jul 2020 09:47:28 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAnfSTsByeHUS9daP_L7M9qF8AhMdPVP9i+ri9b1ZzV8VCkfGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/6/20 2:23 PM, Ross Burton wrote:
> On Fri, 3 Jul 2020 at 15:52, Khem Raj <raj.khem@gmail.com> wrote:
>> +BBFILES_DYNAMIC += " \
>> +    arm-toolchain:${LAYERDIR}/dynamic-layers/arm-toolchain/*/*/*.bb \
>> +    arm-toolchain:${LAYERDIR}/dynamic-layers/arm-toolchain/*/*/*.bbappend \
> 
> What I dislike about dynamic layers is how nested everything gets.
> How about something more like:
> 
> BBFILES_DYNAMIC +=
> "arm-toolchain:${LAYERDIR}/with-arm-toolchain/recipes-*/*/*.bb"
> 
> One less directory level, and all of the dynamic layers are at the
> top-level alongside the recipes.
> 
> I'm also still unsure why there's so much pushback towards adding
> arm-toolchain.  

reason meta-arm is needed for me is becuase meta-ti asks for it and now 
there is another dependency added so I am a bit not-nice to this because 
this serves no use for me as tf-a and tf-m are not even needed for 
machines of interest,  but it does show up on world builds and broke 
last time.

It doesn't do anything by simply adding the layer, if
> you don't build tf-m it won't get used at all, and I want to get rid
> of it anyway (using multiconfig to build a gcc).  Can you explain why
> this dependency is so important to you?  I'm obviously not
> understanding something, and I'm on the record for hating on binary
> toolchains over many years!
> 
> Ross
> 
